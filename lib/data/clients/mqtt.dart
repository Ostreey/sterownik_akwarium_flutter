import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_discovery_model/sensor_discovery_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';

class MyMqttClient {
  late MqttServerClient _client;

  final StreamController<SensorModel> _mqttUpdatesController =
      StreamController<SensorModel>.broadcast();
  final StreamController<bool> _espStatusController =
      StreamController<bool>.broadcast();
  final StreamController<SensorDiscoveryModel> _sensorScanController =
      StreamController<SensorDiscoveryModel>.broadcast();
  final StreamController<CommandAck> _ackController =
      StreamController<CommandAck>.broadcast();

  Stream<SensorModel> get updates => _mqttUpdatesController.stream;
  Stream<bool> get espStatus => _espStatusController.stream;
  Stream<SensorDiscoveryModel> get sensorScanUpdates => _sensorScanController.stream;
  Stream<CommandAck> get acks => _ackController.stream;

  final String mqttServer;
  final int mqttPort;
  final String mqttUser;
  final String mqttPassword;
  final String certificate;

  MyMqttClient({
    required this.mqttServer,
    required this.mqttPort,
    required this.mqttUser,
    required this.mqttPassword,
    required this.certificate,
  }) {
    _client = MqttServerClient.withPort(mqttServer, 'flutter_client', mqttPort);
    _initializeClient();
  }
  bool isConnected() {
    return _client.connectionStatus!.state == MqttConnectionState.connected;
  }

  void _initializeClient() {
    _client.logging(on: true);
    _client.keepAlivePeriod = 60;
    _client.setProtocolV311();

    _client.onConnected = onConnected;
    _client.onDisconnected = onDisconnected;
    _client.onUnsubscribed = onUnsubscribed;
    _client.onSubscribed = onSubscribed;
    _client.onSubscribeFail = onSubscribeFail;
    _client.pongCallback = pong;

    _client.secure = true;

    SecurityContext context = SecurityContext.defaultContext;
    context.setTrustedCertificatesBytes(utf8.encode(certificate));
    _client.securityContext = context;
  }

  Future<void> connect() async {
    final connMessage = MqttConnectMessage()
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    print('MQTT_LOGS::Mosquitto client connecting....');

    _client.connectionMessage = connMessage;
    try {
      await _client.connect(mqttUser, mqttPassword);
    } on Exception catch (e) {
      print('MQTT Client Connection Exception: $e');
      _client.disconnect();
    }

    if (_client.connectionStatus?.state == MqttConnectionState.connected) {
      print('MQTT Client Connected');
    } else {
      print(
          'MQTT Client Connection Failed - status is ${_client.connectionStatus}');
      _client.disconnect();
    }
  }

  void subscribe(String deviceId) {
    // Faza 1: struktura <id>/state|avail|cmd|ack|evt (clean break ze starego
    // golego "001" / "001/status").
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
          _espStatusController.add(payload == "online");
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
          _mqttUpdatesController.add(sensorModel); // Emit SensorModel instance
        }
      } catch (e, stackTrace) {
        print('Error parsing JSON: $e');
        print(stackTrace);
        // Handle or log the error as needed
      }
    });
  }

  Future<void> publish(String topic, MqttClientPayloadBuilder data) async {
    // Faza 1: komendy ida na <id>/cmd/<target>. Wywolania w UI wciaz podaja
    // "<id>/<target>" - przepisujemy w jednym miejscu (Faza 2 przeniesie
    // budowanie topikow do warstwy transportu).
    final cmdTopic = _toCommandTopic(topic);
    try {
      _client.publishMessage(cmdTopic, MqttQos.exactlyOnce, data.payload!);
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

  void disconnect() {
    _client.disconnect();
  }

  void onConnected() {
    print('MQTT Client Connected');
  }

  void onDisconnected() {
    print('MQTT Client Disconnected');
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }

  void onUnsubscribed(String? topic) {
    print('Unsubscribed from $topic');
  }

  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

  void pong() {
    print('Ping response client callback invoked');
  }

  void dispose() {
    _mqttUpdatesController.close();
    _espStatusController.close();
    _sensorScanController.close();
    _ackController.close();
  }
}

/// Potwierdzenie komendy z firmware (topic aq/<id>/ack/<target>).
class CommandAck {
  final String target;
  final String payload;
  CommandAck({required this.target, required this.payload});
}
