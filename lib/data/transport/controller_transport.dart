import 'package:sterownik_akwarium/app/domain/models/sensor_discovery_model/sensor_discovery_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';

/// Rodzaj kanału do sterownika. Faza 2: istnieje tylko [cloud] (HiveMQ).
/// Faza 3 dołoży [local] (broker na ESP32 w LAN, wykrywany przez mDNS).
enum TransportKind { local, cloud }

/// Abstrakcja kanału komunikacji ze sterownikiem akwarium.
///
/// Reszta aplikacji rozmawia ze sterownikiem wyłącznie przez ten interfejs i
/// nie wie, czy dane lecą lokalnie czy przez chmurę. W Fazie 2 jedyną
/// implementacją jest [CloudMqttTransport] (zachowanie 1:1 jak poprzedni
/// `MyMqttClient`); Faza 3 dołoży `LocalMqttTransport` za tym samym kontraktem.
abstract class ControllerTransport {
  /// Czy ten kanał jest lokalny czy chmurowy (do wskaźnika w UI, Faza 3).
  TransportKind get kind;

  /// Czy kanał jest aktualnie połączony z brokerem.
  bool get isConnected;

  /// Telemetria sterownika (`<id>/state`).
  Stream<SensorModel> get telemetry;

  /// Dostępność sterownika (`<id>/avail`): true = online.
  Stream<bool> get availability;

  /// Wynik skanu czujników DS18B20 (`<id>/evt/sensors`).
  Stream<SensorDiscoveryModel> get sensorScan;

  /// Potwierdzenia komend (`<id>/ack/<target>`).
  Stream<CommandAck> get acks;

  /// Łączy z brokerem i subskrybuje topiki danego sterownika.
  Future<void> connect(String deviceId);

  /// Rozłącza z brokerem.
  Future<void> disconnect();

  /// Wysyła komendę do sterownika.
  ///
  /// [target] to device-qualified ścieżka `"<id>/<target>"` (np. `"001/pump1"`,
  /// `"001/scan_sensors"`); transport sam przepisuje ją na topik komendy
  /// `"<id>/cmd/<target>"`. [payload] to gotowy string JSON.
  Future<void> sendCommand(String target, String payload);

  /// Zwalnia zasoby (zamyka strumienie). Po wywołaniu transport jest nieużywalny.
  void dispose();
}

/// Potwierdzenie komendy z firmware (topic `<id>/ack/<target>`).
class CommandAck {
  final String target;
  final String payload;
  CommandAck({required this.target, required this.payload});
}
