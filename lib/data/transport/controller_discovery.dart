import 'dart:async';

import 'package:multicast_dns/multicast_dns.dart';
import 'package:sterownik_akwarium/data/transport/transport_log.dart';

/// Endpoint sterownika znaleziony w sieci lokalnej przez mDNS.
class ControllerEndpoint {
  final String host; // adres IP w LAN
  final int port;
  final String id;
  ControllerEndpoint({required this.host, required this.port, required this.id});

  @override
  String toString() => 'ControllerEndpoint($id @ $host:$port)';
}

/// Odkrywanie sterownika w LAN przez mDNS (usługa `_aqctrl._tcp`, którą
/// rozgłasza firmware — patrz mqttBrokerBegin w Sterownik_akwarium_uC).
///
/// Dzięki temu apka nie wymaga wpisywania adresu IP: jeśli telefon i sterownik
/// są w tej samej sieci WiFi, [discover] zwróci endpoint brokera lokalnego;
/// poza domem (inna sieć / dane komórkowe) zwróci null → fallback na chmurę.
class ControllerDiscovery {
  // MUSI sie zgadzac z nazwa uslugi rozglaszanej przez firmware
  // (mqttBrokerBegin -> MDNS.addService("akwarium", "tcp", 1883)).
  static const String serviceType = '_akwarium._tcp.local';

  /// Szuka sterownika o danym [deviceId]. Zwraca endpoint albo null, gdy nic
  /// nie odpowie w [timeout]. Bezpieczne przy braku sieci/uprawnień multicast
  /// (wyjątki traktowane jak "nie znaleziono").
  Future<ControllerEndpoint?> discover(
    String deviceId, {
    Duration timeout = const Duration(seconds: 2),
  }) async {
    final MDnsClient client = MDnsClient();
    try {
      TLog.log('mdns', 'start lookup $serviceType (id=$deviceId, timeout=${timeout.inMilliseconds}ms)');
      await client.start();

      // 1. PTR -> instancje usługi w LAN (ograniczone timeoutem).
      await for (final PtrResourceRecord ptr in client
          .lookup<PtrResourceRecord>(
              ResourceRecordQuery.serverPointer(serviceType))
          .timeout(timeout, onTimeout: (sink) => sink.close())) {
        TLog.log('mdns', 'PTR -> ${ptr.domainName}');
        // 2. TXT -> sprawdź czy to nasz sterownik (id=<deviceId>).
        String? foundId;
        await for (final TxtResourceRecord txt in client
            .lookup<TxtResourceRecord>(
                ResourceRecordQuery.text(ptr.domainName))
            .timeout(timeout, onTimeout: (sink) => sink.close())) {
          foundId = _parseTxtId(txt.text);
          TLog.log('mdns', 'TXT "${txt.text.replaceAll("\n", " ")}" -> id=$foundId');
          if (foundId != null) break;
        }
        if (foundId != null && foundId != deviceId) {
          TLog.log('mdns', 'pomijam (id=$foundId != $deviceId)');
          continue; // inny sterownik w tej samej sieci
        }

        // 3. SRV -> host + port instancji.
        await for (final SrvResourceRecord srv in client
            .lookup<SrvResourceRecord>(
                ResourceRecordQuery.service(ptr.domainName))
            .timeout(timeout, onTimeout: (sink) => sink.close())) {
          TLog.log('mdns', 'SRV -> ${srv.target}:${srv.port}');
          // 4. A -> adres IPv4 hosta.
          await for (final IPAddressResourceRecord ip in client
              .lookup<IPAddressResourceRecord>(
                  ResourceRecordQuery.addressIPv4(srv.target))
              .timeout(timeout, onTimeout: (sink) => sink.close())) {
            final ep = ControllerEndpoint(
              host: ip.address.address,
              port: srv.port,
              id: foundId ?? deviceId,
            );
            TLog.log('mdns', 'ZNALEZIONO $ep');
            return ep;
          }
        }
      }
      TLog.log('mdns', 'nie znaleziono (timeout/cisza) -> fallback chmura');
    } catch (e) {
      TLog.log('mdns', 'blad/brak sieci: $e -> traktuje jak nie znaleziono');
      // brak sieci / brak uprawnień multicast → traktujemy jak "nie znaleziono"
    } finally {
      client.stop();
    }
    return null;
  }

  /// TXT bywa wielokluczowy ("id=001\nfoo=bar") — wyłuskaj wartość klucza `id`.
  String? _parseTxtId(String txt) {
    for (final line in txt.split('\n')) {
      final t = line.trim();
      if (t.startsWith('id=')) return t.substring(3);
    }
    return null;
  }
}
