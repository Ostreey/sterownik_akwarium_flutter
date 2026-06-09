import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/mqttData.dart';
import 'package:sterownik_akwarium/app/domain/models/devices_model/devices_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_discovery_model/sensor_discovery_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/app/pages/choose_controller_page/choose_controller_view_model_provider.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/data/transport/cloud_mqtt_transport.dart';
import 'package:sterownik_akwarium/data/transport/controller_discovery.dart';
import 'package:sterownik_akwarium/data/transport/controller_transport.dart';
import 'package:sterownik_akwarium/data/transport/local_mqtt_transport.dart';


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

/// Aktualnie aktywny kanał do sterownika. Reszta apki watchuje TEN provider —
/// nie wie, czy dane lecą lokalnie (broker na ESP32) czy przez chmurę.
/// Zarządza tym [TransportManager] (Faza 3): preferuje lokalny, fallback chmura.
final activeTransportProvider =
    NotifierProvider<TransportManager, ControllerTransport>(
        TransportManager.new);

/// Rodzaj aktywnego kanału (do wskaźnika w UI: lokalnie vs przez chmurę).
final activeTransportKindProvider = Provider<TransportKind>((ref) {
  return ref.watch(activeTransportProvider).kind;
});

/// Wybiera kanał automatycznie — zero ręcznego przełączania.
///
/// Zasada: „lokalny, jeśli osiągalny; inaczej chmura". Sterownik rozgłasza się
/// w LAN przez mDNS; jeśli telefon jest w tej samej sieci, łączymy się wprost
/// do brokera na sterowniku (szybciej, działa bez internetu). Poza domem mDNS
/// nic nie znajdzie → chmura HiveMQ. Decyzja zapada przy starcie i przy każdej
/// zmianie sieci (connectivity_plus).
class TransportManager extends Notifier<ControllerTransport> {
  final ControllerDiscovery _discovery = ControllerDiscovery();
  StreamSubscription<ConnectivityResult>? _connSub;
  bool _evaluating = false;

  @override
  ControllerTransport build() {
    ref.onDispose(() {
      _connSub?.cancel();
      // state to bieżący transport — sprzątamy go przy zamykaniu providera.
      state.disconnect();
      state.dispose();
    });

    // Re-ewaluacja przy zmianie sieci (WiFi <-> komórka, inna sieć WiFi).
    _connSub =
        Connectivity().onConnectivityChanged.listen((_) => _evaluate());

    // Re-ewaluacja, gdy użytkownik zmieni sterownik.
    ref.listen(selectedControllerProvider, (_, __) => _evaluate());

    // Start: domyślnie chmura (natychmiast dostępna), w tle szukamy lokalnego.
    final initial = _buildCloud();
    scheduleMicrotask(_evaluate);
    return initial;
  }

  CloudMqttTransport _buildCloud() => CloudMqttTransport(
        mqttServer: MqttConstants.server,
        mqttPort: MqttConstants.port,
        mqttUser: MqttConstants.user,
        mqttPassword: MqttConstants.password,
        certificate: MqttConstants.certificate,
      );

  LocalMqttTransport _buildLocal(ControllerEndpoint ep) => LocalMqttTransport(
        host: ep.host,
        port: ep.port,
        mqttUser: MqttConstants.user,
        mqttPassword: MqttConstants.password,
      );

  Future<void> _evaluate() async {
    if (_evaluating) return;
    _evaluating = true;
    try {
      final deviceId = ref.read(selectedControllerProvider)?.id ?? "";
      final ep = deviceId.isEmpty ? null : await _discovery.discover(deviceId);

      final wantLocal = ep != null;
      final isLocal = state.kind == TransportKind.local;

      if (wantLocal && !isLocal) {
        _swap(_buildLocal(ep)); // znaleziono w LAN -> przełącz na lokalny
      } else if (!wantLocal && isLocal) {
        _swap(_buildCloud()); // zniknął z LAN -> wróć na chmurę
      }
      // wantLocal && isLocal lub !wantLocal && !isLocal -> zostaw bieżący.
    } finally {
      _evaluating = false;
    }
  }

  void _swap(ControllerTransport next) {
    final old = state;
    state = next; // dependenci (mqttUpdates/status/scan) przepną się na nowy
    old.disconnect();
    old.dispose();
  }
}
