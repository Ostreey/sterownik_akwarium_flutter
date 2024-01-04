import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';

class MyMqttClient {
  late MqttServerClient _client;

  final StreamController<SensorModel> _mqttUpdatesController = StreamController<SensorModel>.broadcast();

  Stream<SensorModel> get updates => _mqttUpdatesController.stream;

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
      print('MQTT Client Connection Failed - status is ${_client.connectionStatus}');
      _client.disconnect();

    }
  }

  void subscribe(String topic) {
    _client.subscribe(topic, MqttQos.atLeastOnce);

    _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
      final String payload = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      try {
        final jsonData = json.decode(payload) as Map<String, dynamic>;
        log("MQTTDATA:  $jsonData");
        final sensorModel = SensorModel.fromJson(jsonData);

        _mqttUpdatesController.add(sensorModel); // Emit SensorModel instance
      } catch (e, stackTrace) {
        print('Error parsing JSON: $e');
        print(stackTrace);
        // Handle or log the error as needed
      }
    });
  }

  Future<void> publish(String topic, MqttClientPayloadBuilder data) async{
    try{
      var response = await _client.publishMessage(topic, MqttQos.exactlyOnce, data.payload!);
      debugPrint("topic sent now: $topic");

    }catch(e){
      debugPrint("Error: ${e}");
    }
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
  }
}
