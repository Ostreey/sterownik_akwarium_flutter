# CLAUDE.md — Aplikacja mobilna

Kontekst i pełna dokumentacja: [../ONBOARDING.md §6](../ONBOARDING.md#6-aplikacja-mobilna-flutter).

## Stack

- Flutter 3.2+ / Dart.
- Riverpod 2.6+ (state), GoRouter 10 (routing).
- Firebase Auth + Firestore. `firebase_messaging` w pubspec, **obsługa wyłączona** (do włączenia — Roadmap pkt 5).
- `mqtt_client` 10.0 → HiveMQ Cloud (TLS 8883) **i** broker lokalny na ESP32 (LAN, 1883, bez TLS).
- `multicast_dns` (odkrywanie sterownika w LAN), `connectivity_plus` (re-ewaluacja kanału przy zmianie sieci) — Faza 3.
- Freezed + json_serializable.

## Komendy

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
flutter analyze
```

## Struktura (Clean Architecture)

```
lib/
├── app/
│   ├── core/         providers, router, mqttData, themes
│   ├── domain/models/  sensor_model, devices_model, timer_device_model, ...
│   └── pages/        UI per ekran
├── data/
│   ├── transport/                  ControllerTransport (interfejs); MqttTransportBase
│   │                               + CloudMqttTransport/LocalMqttTransport;
│   │                               ControllerDiscovery (mDNS). Manager: mqtt_provider.dart
│   └── repositories/               auth_repository, firebase_repository
├── domain/usecases/                login, register, logout, fetch/add controller
└── main.dart
```

## Zasady pracy w tym kodzie

- **State management = Riverpod.** Nie wprowadzaj `Provider`, `Bloc`, `GetX` itp.
- **Komunikacja ze sterownikiem = `ControllerTransport`** ([`lib/data/transport/`](lib/data/transport/)). UI i providery rozmawiają przez `activeTransportProvider` (zwraca `ControllerTransport`), NIGDY przez konkretną implementację. `sendCommand(target, payload)` przyjmuje device-qualified `target` `"<id>/<target>"` i payload jako String — nie używaj `MqttClientPayloadBuilder` w UI. Wspólna logika MQTT jest w `MqttTransportBase`; `CloudMqttTransport`/`LocalMqttTransport` różnią się tylko TLS+endpointem. **Wyboru kanału NIE robisz ręcznie** — `TransportManager` (Notifier za `activeTransportProvider`) sam preferuje lokalny (mDNS w LAN), fallback chmura, re-eval przy zmianie sieci. Rodzaj kanału: `activeTransportKindProvider`. **Android: mDNS wymaga jeszcze `MulticastLock` w runtime (do dorobienia/zweryfikowania na sprzęcie)** — patrz `[[project-mqtt-modernization]]`.
- **Routing = GoRouter.** Wszystkie nowe trasy przez konfigurację w [`lib/app/core/router.dart`](lib/app/core/router.dart).
- **Modele = Freezed + json_serializable.** Po każdej zmianie modelu uruchom `dart run build_runner build --delete-conflicting-outputs`. Nie ręcznie edytuj plików `.freezed.dart` / `.g.dart`.
- **`deviceNumber = "001"` zaszyte** w kilku miejscach ([`lib/app/core/providers.dart`](lib/app/core/providers.dart), parameters_page, home_page). Nie ruszaj póki nie zrobimy flow przez [`choose_controller_page`](lib/app/pages/choose_controller_page) (Roadmap pkt 3).
- **Hasła MQTT w plaintext** w [`lib/app/core/mqttData.dart`](lib/app/core/mqttData.dart) — MVP, nie dodawaj nowych sekretów do repo.
- **Format JSON MQTT** musi się zgadzać z firmware. Patrz [ONBOARDING.md §4.7](../ONBOARDING.md#47-komunikacja-mqtt). Każda zmiana ⇒ aktualizuj [../Sterownik_akwarium_uC/CLAUDE.md](../Sterownik_akwarium_uC/CLAUDE.md).
- **Firestore struktura:** `users/{uid}/controllers/{controllerId}`. Security rules są utrzymywane poza repo (Firebase Console — do potwierdzenia).
- **Folder `alarms_page/`** istnieje, ale strategia (live z MQTT vs Firestore) nie jest jeszcze ustalona (Otwarte pytanie nr 6 → punkt do przedyskutowania, Roadmap pkt 6).

## Częste zadania → gdzie szukać w ONBOARDING

- Flow użytkownika (login → choose controller → home) → [§6 Przepływ użytkownika](../ONBOARDING.md#przepływ-użytkownika)
- Format wiadomości MQTT (TX/RX) → [§4.7](../ONBOARDING.md#47-komunikacja-mqtt)
- Lista funkcji do zrobienia → [§11 Roadmap](../ONBOARDING.md#11-roadmap--do-zrobienia)
