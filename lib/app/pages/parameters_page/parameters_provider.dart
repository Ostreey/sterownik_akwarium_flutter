/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/mqttData.dart';
import 'package:sterownik_akwarium/app/domain/models/sensors_model.dart';
import 'package:sterownik_akwarium/data/clients/mqtt.dart';


final mqttStateProvider = StateNotifierProvider<MqttStateNotifier, MqttData>((ref) {
  final mqttClient = ref.read(mqttClientProvider);
  debugPrint("TEST1");
  return MqttStateNotifier(mqttClient);
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



class MqttStateNotifier extends StateNotifier<MqttData> {
  final MyMqttClient mqttClient;

  MqttStateNotifier(this.mqttClient) : super(MqttData('')) {
    mqttClient.connect().then((_) {
      mqttClient.subscribe('testTopic');
      mqttClient.updates.listen((data) {
        state = MqttData(data);
        debugPrint("MQTTDATA:  ${state.message}");
      });
    });
  }

  @override
  void dispose() {
    mqttClient.dispose();
    super.dispose();
  }
}
*/
