import 'package:sterownik_akwarium/data/transport/controller_transport.dart';
import 'package:sterownik_akwarium/data/transport/mqtt_transport_base.dart';

/// Kanał chmurowy do sterownika przez HiveMQ Cloud (MQTT over TLS, 8883).
///
/// Cała logika MQTT jest w [MqttTransportBase]; tutaj tylko TLS + certyfikat
/// (przez `secure: true`) i [kind] = cloud.
class CloudMqttTransport extends MqttTransportBase {
  CloudMqttTransport({
    required String mqttServer,
    required int mqttPort,
    required String mqttUser,
    required String mqttPassword,
    required String certificate,
  }) : super(
          mqttServer: mqttServer,
          mqttPort: mqttPort,
          mqttUser: mqttUser,
          mqttPassword: mqttPassword,
          secure: true,
          certificate: certificate,
        );

  @override
  TransportKind get kind => TransportKind.cloud;
}
