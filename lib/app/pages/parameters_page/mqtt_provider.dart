import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/mqttData.dart';
import 'package:sterownik_akwarium/app/domain/models/mqtt_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensors_model.dart';
import 'package:sterownik_akwarium/data/clients/mqtt.dart';


final mqttUpdatesProvider = StreamProvider<SensorModel>((ref) {
  final mqttClient = ref.watch(mqttClientProvider);
  mqttClient.connect().then((_) => mqttClient.subscribe('testTopic'));
  return mqttClient.updates;
});


final mqttClientProvider = Provider<MyMqttClient>((ref) {
  return MyMqttClient(
    mqttServer: MqttConstants.server,
    mqttPort: MqttConstants.port,
    mqttUser: MqttConstants.user,
    mqttPassword: MqttConstants.password,
    certificate: MqttConstants.certificate,
  );
});




