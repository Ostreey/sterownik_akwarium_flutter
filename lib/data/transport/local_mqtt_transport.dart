import 'package:sterownik_akwarium/data/transport/controller_transport.dart';
import 'package:sterownik_akwarium/data/transport/mqtt_transport_base.dart';

/// Kanał lokalny do brokera MQTT działającego na samym sterowniku (ESP32) w
/// sieci LAN — bez TLS, port 1883. Endpoint ([host]) pochodzi z odkrycia przez
/// mDNS, więc użytkownik nie wpisuje żadnego adresu IP.
///
/// Działa bez internetu: telefon i sterownik muszą być w tej samej sieci WiFi.
/// Cała logika MQTT jest w [MqttTransportBase]; tutaj tylko brak TLS i
/// [kind] = local.
class LocalMqttTransport extends MqttTransportBase {
  LocalMqttTransport({
    required String host,
    required int port,
    required String mqttUser,
    required String mqttPassword,
  }) : super(
          mqttServer: host,
          mqttPort: port,
          mqttUser: mqttUser,
          mqttPassword: mqttPassword,
          secure: false,
        );

  @override
  TransportKind get kind => TransportKind.local;
}
