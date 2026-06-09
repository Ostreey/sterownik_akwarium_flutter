import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
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
import 'package:sterownik_akwarium/data/transport/transport_log.dart';


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
          pompa3: sensorModel.pompa3,
          pompa4: sensorModel.pompa4,
          pompa5: sensorModel.pompa5,
          pompa6: sensorModel.pompa6,
          pompa7: sensorModel.pompa7,
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
/// nic nie znajdzie → chmura HiveMQ. Decyzja zapada przy starcie, przy każdej
/// zmianie sieci (connectivity_plus), po powrocie z tła (AppLifecycleState) oraz
/// gdy aktywny transport zgłosi utratę połączenia (avail=false).
class TransportManager extends Notifier<ControllerTransport>
    with WidgetsBindingObserver {
  final ControllerDiscovery _discovery = ControllerDiscovery();
  StreamSubscription<ConnectivityResult>? _connSub;
  StreamSubscription<bool>? _availSub;
  Timer? _periodicEval;
  bool _evaluating = false;

  // Kiedy ostatnio podmieniliśmy transport. Świeżo utworzony transport łączy się
  // asynchronicznie (connect woła mqttUpdatesProvider) — w tym oknie isConnected
  // jest false, więc nie traktujemy go jako "martwy do rekonektu".
  DateTime _lastSwapAt = DateTime.now();
  static const Duration _settleGrace = Duration(seconds: 8);
  // Okresowa re-ewaluacja: domyka cykl rozłącz→podłącz (powrót na lokalny gdy
  // sterownik wróci do LAN) i rekonekt martwego kanału.
  static const Duration _evalInterval = Duration(seconds: 15);

  @override
  ControllerTransport build() {
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _connSub?.cancel();
      _availSub?.cancel();
      _periodicEval?.cancel();
      state.disconnect();
      state.dispose();
    });

    WidgetsBinding.instance.addObserver(this);

    // Re-ewaluacja przy zmianie sieci (WiFi <-> komórka, inna sieć WiFi).
    _connSub = Connectivity().onConnectivityChanged.listen((result) {
      TLog.log('manager', 'zmiana sieci ($result) -> re-ewaluacja');
      _evaluate();
    });

    // Re-ewaluacja, gdy użytkownik zmieni sterownik.
    ref.listen(selectedControllerProvider, (_, __) {
      TLog.log('manager', 'zmiana sterownika -> re-ewaluacja');
      _evaluate();
    });

    // Okresowo: fallback gdy inne triggery nie wystarczą.
    _periodicEval = Timer.periodic(_evalInterval, (_) => _evaluate());

    // Start: domyślnie chmura (natychmiast dostępna), w tle szukamy lokalnego.
    TLog.log('manager', 'start na chmurze, w tle szukam lokalnego');
    _lastSwapAt = DateTime.now();
    final initial = _buildCloud();
    _watchAvailability(initial);
    scheduleMicrotask(_evaluate);
    return initial;
  }

  // Nasłuchuje strumień availability aktywnego transportu. Gdy transport zgłosi
  // avail=false (watchdog, rozłączenie), od razu wyzwalamy re-ewaluację zamiast
  // czekać na periodyczny timer (nawet do 15 s).
  void _watchAvailability(ControllerTransport transport) {
    _availSub?.cancel();
    _availSub = transport.availability.listen((avail) {
      if (!avail) {
        final settling = DateTime.now().difference(_lastSwapAt) < _settleGrace;
        if (!settling) {
          TLog.log('manager', 'avail=false -> natychmiastowa re-ewaluacja');
          _evaluate();
        }
      }
    });
  }

  // Powrót z tła: natychmiastowa re-ewaluacja zamiast czekania na periodyczny timer.
  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.resumed) {
      TLog.log('manager', 'foreground (resumed) -> re-ewaluacja');
      _evaluate();
    }
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
    if (_evaluating) {
      TLog.log('manager', 're-ewaluacja w toku - pomijam');
      return;
    }
    _evaluating = true;
    try {
      final isLocal = state.kind == TransportKind.local;
      final connected = state.isConnected;
      // W oknie grace świeży transport jeszcze się łączy — nie rekonektujemy go.
      final settling = DateTime.now().difference(_lastSwapAt) < _settleGrace;

      // Opt 1: mDNS/lokalny ma sens tylko w LAN (WiFi/ethernet). Na danych
      // komórkowych / bez sieci nie odpalamy discovery (oszczędność) i zostajemy
      // na chmurze.
      final conn = await Connectivity().checkConnectivity();
      final onLan =
          conn == ConnectivityResult.wifi || conn == ConnectivityResult.ethernet;

      if (!onLan) {
        if (isLocal) {
          TLog.log('manager', 'eval: brak LAN ($conn) -> chmura');
          _swap(_buildCloud()); // poza LAN lokalny nieosiągalny -> chmura
        } else if (!connected && !settling) {
          _swap(_buildCloud()); // chmura martwa -> rekonekt
        } else {
          TLog.log('manager', 'eval: brak LAN ($conn), zostawiam cloud');
        }
        return;
      }

      // Opt 2: jesteśmy lokalnie i połączeni -> nie ma po co odpytywać mDNS.
      // Utratę połączenia wykryje watchdog telemetrii (-> avail=offline), a
      // ten sam timer i tak wróci tu za 15 s gdy connected spadnie.
      if (isLocal && connected) {
        TLog.log('manager', 'eval: local+connected -> pomijam discovery');
        return;
      }

      final deviceId = ref.read(selectedControllerProvider)?.id ?? "";
      final ep = deviceId.isEmpty ? null : await _discovery.discover(deviceId);
      TLog.log('manager',
          'eval: lokalny dostepny=${ep != null}, aktywny=${state.kind.name} (connected=$connected, settling=$settling)');

      if (ep != null) {
        // Lokalny osiągalny w LAN — chcemy być na nim.
        if (!isLocal) {
          _swap(_buildLocal(ep)); // przełącz chmura -> lokalny
        } else if (!connected && !settling) {
          _swap(_buildLocal(ep)); // lokalny martwy -> rekonekt (świeża instancja/IP)
        } else {
          TLog.log('manager', 'eval: zostawiam local');
        }
      } else {
        // Brak lokalnego w LAN — chmura.
        if (isLocal) {
          _swap(_buildCloud()); // zniknął z LAN -> wróć na chmurę
        } else if (!connected && !settling) {
          _swap(_buildCloud()); // chmura martwa -> rekonekt
        } else {
          TLog.log('manager', 'eval: zostawiam cloud');
        }
      }
    } finally {
      _evaluating = false;
    }
  }

  void _swap(ControllerTransport next) {
    final old = state;
    TLog.log('manager', 'SWAP ${old.kind.name} -> ${next.kind.name}');
    _lastSwapAt = DateTime.now();
    _watchAvailability(next);
    state = next; // dependenci (mqttUpdates/status/scan) przepną się na nowy
    old.disconnect();
    old.dispose();
  }
}
