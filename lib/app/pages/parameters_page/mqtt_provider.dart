import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/mqttData.dart';
import 'package:sterownik_akwarium/app/domain/models/devices_model/devices_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_discovery_model/sensor_discovery_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/app/pages/choose_controller_page/choose_controller_view_model_provider.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/data/transport/cloud_mqtt_transport.dart';
import 'package:sterownik_akwarium/data/transport/controller_transport.dart';


final mqttUpdatesProvider = StreamProvider<SensorModel>((ref) {
  final transport = ref.watch(activeTransportProvider);
  final selectedController = ref.watch(selectedControllerProvider);

  final deviceId = selectedController?.id ?? "";

  transport.connect(deviceId);

  transport.telemetry.listen((sensorModel) {
    ref.read(devicesProvider.notifier).updateDevices(DevicesModel(
          circulation1: sensorModel.circul1,
          circulation2: sensorModel.circul2,
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

  return transport.telemetry;
});

final mqttStatusProvider = StreamProvider<bool>((ref) {
  final transport = ref.watch(activeTransportProvider);
  return transport.availability;
});

final sensorScanProvider = StreamProvider<SensorDiscoveryModel>((ref) {
  return ref.watch(activeTransportProvider).sensorScan;
});

/// Aktualnie aktywny kanał do sterownika. Faza 2: zawsze chmura (HiveMQ).
/// Faza 3 podmieni to na wybór lokalny/chmura (mDNS + connectivity).
/// Reszta apki watchuje TEN provider, nie konkretną implementację.
final activeTransportProvider = Provider<ControllerTransport>((ref) {
  return ref.watch(cloudMqttTransportProvider);
});

final cloudMqttTransportProvider = Provider<CloudMqttTransport>((ref) {
  return CloudMqttTransport(
    mqttServer: MqttConstants.server,
    mqttPort: MqttConstants.port,
    mqttUser: MqttConstants.user,
    mqttPassword: MqttConstants.password,
    certificate: MqttConstants.certificate,
  );
});
