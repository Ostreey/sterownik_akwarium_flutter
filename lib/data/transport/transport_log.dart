import 'dart:developer' as developer;

/// Flaga debug warstwy transportu.
///
/// Gdy `false` — żadne logi transportu nie są emitowane (zero kosztu, czysta
/// konsola). Ustaw `true` na czas debugowania wyboru kanału / mDNS / połączeń.
/// TODO: przed wydaniem produkcyjnym ustawić na `false`.
const bool kTransportDebug = true;

/// Lekki logger zdarzeń warstwy transportu (wybór kanału, discovery mDNS,
/// connect/disconnect, swap). Widoczny w logcat / konsoli `flutter run` pod
/// nazwą `transport/<tag>`. Filtr w logcat: tag zawiera "transport".
class TLog {
  static void log(String tag, String msg) {
    if (!kTransportDebug) return;
    developer.log(msg, name: 'transport/$tag');
  }
}
