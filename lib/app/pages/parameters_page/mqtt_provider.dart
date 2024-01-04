import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/mqttData.dart';
import 'package:sterownik_akwarium/app/domain/models/devices_model/devices_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/data/clients/mqtt.dart';


final mqttUpdatesProvider = StreamProvider<SensorModel>((ref) {
  final mqttClient = ref.watch(mqttClientProvider);
  final deviceNumber = "001";
  mqttClient.connect().then((_) => mqttClient.subscribe(deviceNumber));

  mqttClient.updates.listen((sensorModel) {

    ref.read(devicesProvider.notifier).updateDevices(
        DevicesModel(circulation1: sensorModel.circulation1,
          circulation2: sensorModel.circulation2,
          pompa1: sensorModel.pompa1,
          pompa2: sensorModel.pompa2,
          socket1: sensorModel.soc1.state,
          socket2: sensorModel.soc2.state,
          socket3: sensorModel.soc3.state,
          socket4: sensorModel.soc4.state,
          socket5: sensorModel.soc5.state,
          socket6: sensorModel.soc6.state,
          socket7: sensorModel.soc7.state,
          led: sensorModel.led,
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




