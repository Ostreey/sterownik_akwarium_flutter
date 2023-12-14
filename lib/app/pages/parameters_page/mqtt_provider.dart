import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/mqttData.dart';
import 'package:sterownik_akwarium/app/domain/models/devices_model/devices_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/data/clients/mqtt.dart';


final mqttUpdatesProvider = StreamProvider<SensorModel>((ref) {
  final mqttClient = ref.watch(mqttClientProvider);
  mqttClient.connect().then((_) => mqttClient.subscribe('testTopic'));

  mqttClient.updates.listen((sensorModel) {

    ref.read(devicesProvider.notifier).updateDevices(
        DevicesModel(circulation1: sensorModel.circulation1,
          circulation2: sensorModel.circulation2,
          pompa1: sensorModel.pompa1,
          pompa2: sensorModel.pompa2,
    ));
  });

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




