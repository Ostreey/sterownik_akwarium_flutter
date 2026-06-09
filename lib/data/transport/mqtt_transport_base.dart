import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_discovery_model/sensor_discovery_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/data/transport/controller_transport.dart';

/// Wspólna implementacja [ControllerTransport] oparta o `mqtt_client`.
///
/// Kanał chmurowy (HiveMQ, TLS) i lokalny (broker na ESP32 w LAN, bez TLS)
/// różnią się tylko endpointem i tym, czy połączenie jest szyfrowane — cała
/// reszta (subskrypcje, parsowanie, budowanie topiku komendy, strumienie) jest
/// identyczna i mieszka tutaj. Podklasy dostarczają jedynie [kind].
abstract class MqttTransportBase implements ControllerTransport {
  late final MqttServerClient _client;

  final StreamController<SensorModel> _telemetryController =
      StreamController<SensorModel>.broadcast();
  final StreamController<bool> _availabilityController =
      StreamController<bool>.broadcast();
  final StreamController<SensorDiscoveryModel> _sensorScanController =
      StreamController<SensorDiscoveryModel>.broadcast();
  final StreamController<CommandAck> _ackController =
      StreamController<CommandAck>.broadcast();

  @override
  Stream<SensorModel> get telemetry => _telemetryController.stream;
  @override
  Stream<bool> get availability => _availabilityController.stream;
  @override
  Stream<SensorDiscoveryModel> get sensorScan => _sensorScanController.stream;
  @override
  Stream<CommandAck> get acks => _ackController.stream;

  final String mqttServer;
  final int mqttPort;
  final String mqttUser;
  final String mqttPassword;

  MqttTransportBase({
    required this.mqttServer,
    required this.mqttPort,
    required this.mqttUser,
    required this.mqttPassword,
    required bool secure,
    String? certificate,
  }) {
    _client = MqttServerClient.withPort(mqttServer, 'flutter_client', mqttPort);
    _client.logging(on: true);
    _client.keepAlivePeriod = 60;
    _client.setProtocolV311();

    _client.onConnected = _onConnected;
    _client.onDisconnected = _onDisconnected;
    _client.onUnsubscribed = _onUnsubscribed;
    _client.onSubscribed = _onSubscribed;
    _client.onSubscribeFail = _onSubscribeFail;
    _client.pongCallback = _pong;

    _client.secure = secure;
    if (secure && certificate != null) {
      final SecurityContext context = SecurityContext.defaultContext;
      context.setTrustedCertificatesBytes(utf8.encode(certificate));
      _client.securityContext = context;
    }
  }

  @override
  bool get isConnected =>
      _client.connectionStatus?.state == MqttConnectionState.connected;

  @override
  Future<void> connect(String deviceId) async {
    final connMessage = MqttConnectMessage()
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    print('MQTT_LOGS::[$kind] client connecting....');

    _client.connectionMessage = connMessage;
    try {
      await _client.connect(mqttUser, mqttPassword);
    } on Exception catch (e) {
      print('MQTT Client Connection Exception: $e');
      _client.disconnect();
    }

    if (_client.connectionStatus?.state == MqttConnectionState.connected) {
      print('MQTT Client Connected [$kind]');
      _subscribe(deviceId);
      // Broker lokalny nie retainuje avail (ignoruje retained), a sam fakt
      // polaczenia z nim = sterownik zyje (broker dziala na sterowniku). Dla
      // chmury avail przychodzi z retained topiku <id>/avail (nie syntezujemy).
      if (kind == TransportKind.local) {
        _availabilityController.add(true);
      }
    } else {
      print(
          'MQTT Client Connection Failed - status is ${_client.connectionStatus}');
      _client.disconnect();
    }
  }

  void _subscribe(String deviceId) {
    // Struktura <id>/state|avail|cmd|ack|evt (Faza 1) - identyczna na obu
    // brokerach (chmura i lokalny), wiec subskrypcje nie zaleza od kanalu.
    final String stateTopic = "$deviceId/state";
    final String availTopic = "$deviceId/avail";
    final String sensorsTopic = "$deviceId/evt/sensors";
    final String ackPrefix = "$deviceId/ack/";

    _client.subscribe(stateTopic, MqttQos.atLeastOnce);
    _client.subscribe(availTopic, MqttQos.atLeastOnce);
    _client.subscribe(sensorsTopic, MqttQos.atLeastOnce);
    _client.subscribe("$ackPrefix#", MqttQos.atLeastOnce);

    _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
      final String receivedTopic = c[0].topic;
      final String payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('Received message: $payload from topic: $receivedTopic');

      try {
        if (receivedTopic == availTopic) {
          print("Availability: $payload");
          _availabilityController.add(payload == "online");
        } else if (receivedTopic == sensorsTopic) {
          final jsonData = json.decode(payload) as Map<String, dynamic>;
          final discovery = SensorDiscoveryModel.fromJson(jsonData);
          _sensorScanController.add(discovery);
        } else if (receivedTopic.startsWith(ackPrefix)) {
          final target = receivedTopic.substring(ackPrefix.length);
          _ackController.add(CommandAck(target: target, payload: payload));
        } else if (receivedTopic == stateTopic) {
          final jsonData = json.decode(payload) as Map<String, dynamic>;
          log("MQTTDATA:  $jsonData");
          final sensorModel = SensorModel.fromJson(jsonData);
          _telemetryController.add(sensorModel);
        }
      } catch (e, stackTrace) {
        print('Error parsing JSON: $e');
        print(stackTrace);
      }
    });
  }

  @override
  Future<void> sendCommand(String target, String payload) async {
    // Komendy ida na <id>/cmd/<target>. UI podaje device-qualified "<id>/<target>".
    final cmdTopic = _toCommandTopic(target);
    final builder = MqttClientPayloadBuilder()..addString(payload);
    try {
      _client.publishMessage(cmdTopic, MqttQos.exactlyOnce, builder.payload!);
      debugPrint("topic sent now: $cmdTopic");
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  // "<id>/<target>" -> "<id>/cmd/<target>".
  String _toCommandTopic(String topic) {
    final i = topic.indexOf('/');
    if (i < 0) return topic;
    final id = topic.substring(0, i);
    final target = topic.substring(i + 1);
    return "$id/cmd/$target";
  }

  @override
  Future<void> disconnect() async {
    _client.disconnect();
  }

  void _onConnected() => print('MQTT Client Connected [$kind]');
  void _onDisconnected() {
    print('MQTT Client Disconnected [$kind]');
    // Lokalnie: utrata polaczenia z brokerem = sterownik nieosiagalny w LAN.
    if (kind == TransportKind.local && !_availabilityController.isClosed) {
      _availabilityController.add(false);
    }
  }

  void _onSubscribed(String topic) => print('Subscribed to $topic');
  void _onUnsubscribed(String? topic) => print('Unsubscribed from $topic');
  void _onSubscribeFail(String topic) => print('Failed to subscribe $topic');
  void _pong() => print('Ping response client callback invoked');

  @override
  void dispose() {
    _telemetryController.close();
    _availabilityController.close();
    _sensorScanController.close();
    _ackController.close();
  }
}
