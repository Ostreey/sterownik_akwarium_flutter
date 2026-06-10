import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/core/providers.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_page_model/timer_page_model.dart';
import 'package:sterownik_akwarium/app/pages/alarms_page/alarms.dart';
import 'package:sterownik_akwarium/app/pages/choose_controller_page/choose_controller_page.dart';
import 'package:sterownik_akwarium/app/pages/choose_controller_page/choose_controller_view_model_provider.dart';
import 'package:sterownik_akwarium/app/pages/login_page/login_page.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';
import 'package:sterownik_akwarium/app/pages/widgets/snackbar.dart';
import 'package:sterownik_akwarium/data/transport/controller_transport.dart';

import '../choose_controller_page/choose_controller_page.dart';
import '../devices_page/devices.dart';
import '../parameters_page/parameters.dart';
import '../scan_sensors_page/scan_sensors_page.dart';
import '../timer_page/timer_page.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) {
          return element.name == tab;
        });

  static final tabs = [
    Parameters.pageConfig,
    Devices.pageConfig,
    Alarms.pageConfig
  ];

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.home_rounded,
    name: '/home',
  );

  final int index;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Watch utrzymuje aktywne polaczenie/telemetrie; same wartosci nie sa tu
    // potrzebne (konfiguracje timerow ekran timera pobiera read-on-demand).
    ref.watch(mqttUpdatesProvider);
    final homePageViewmodel = ref.watch(homePageViewmodelProvider);
    final selectedController = ref.watch(selectedControllerProvider);
    // Status z topiku <id>/avail (online/offline). Dopoki nie przyjdzie -> offline.
    final isOnline = ref.watch(mqttStatusProvider).valueOrNull ?? false;
    // Faza 3: czy aktywny kanal jest lokalny (LAN) czy przez chmure.
    final transportKind = ref.watch(activeTransportKindProvider);
    final isLocal = transportKind == TransportKind.local;

    ref.listen(homePageViewmodelProvider, (previous, next) {
      if (next is AsyncError) {
        Snackbar.show(context, next.error.toString());
      } else if (next is AsyncData) {
        context.goNamed(LoginPage.pageConfig.name);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(isOnline ? "Podłączony" : "Niepodłączony"),
            if (isOnline) ...[
              const SizedBox(width: 8),
              Icon(
                isLocal ? Icons.home_outlined : Icons.cloud_outlined,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                isLocal ? "lokalnie" : "chmura",
                style: const TextStyle(fontSize: 12),
              ),
            ],
            const Spacer(),
            Icon(
              isOnline ? Icons.wifi : Icons.wifi_off,
              color: isOnline ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Text(
                    "Sterownik akwarium",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  ClipOval(
                      child: Image.asset(
                    'assets/logo.png',
                    width: 80,
                    height: 80,
                  )),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.heat_pump_outlined),
              // Choose an appropriate icon
              title: const Text("Pompa 1"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 1",
                    endpoint: "${selectedController?.id}/pompa1");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.heat_pump_outlined),
              // Choose an appropriate icon
              title: const Text("Pompa 2"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 2",
                    endpoint: "${selectedController?.id}/pompa2");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.heat_pump_outlined),
              title: const Text("Pompa 3"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 3",
                    endpoint: "${selectedController?.id}/pompa3");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.heat_pump_outlined),
              title: const Text("Pompa 4"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 4",
                    endpoint: "${selectedController?.id}/pompa4");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.heat_pump_outlined),
              title: const Text("Pompa 5"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 5",
                    endpoint: "${selectedController?.id}/pompa5");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.heat_pump_outlined),
              title: const Text("Pompa 6"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 6",
                    endpoint: "${selectedController?.id}/pompa6");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.heat_pump_outlined),
              title: const Text("Pompa 7"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 7",
                    endpoint: "${selectedController?.id}/pompa7");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.water_drop),
              // Choose an appropriate icon
              title: const Text("Cyrkulacja 1"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Cyrkulacja 1",
                    endpoint: "${selectedController?.id}/circul1");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.water_drop),
              // Choose an appropriate icon
              title: const Text("Cyrkulacja 2"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Cyrkulacja 2",
                    endpoint: "${selectedController?.id}/circul2");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb),
              // Choose an appropriate icon
              title: const Text("LED"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "LED",
                    endpoint: "${selectedController?.id}/led");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: const Text("Gniazdo 1"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 1",
                    endpoint: "${selectedController?.id}/soc1");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: const Text("Gniazdo 2"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 2",
                    endpoint: "${selectedController?.id}/soc2");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: const Text("Gniazdo 3"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 3",
                    endpoint: "${selectedController?.id}/soc3");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: const Text("Gniazdo 4"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 4",
                    endpoint: "${selectedController?.id}/soc4");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: const Text("Gniazdo 5"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 5",
                    endpoint: "${selectedController?.id}/soc5");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electrical_services),
              title: const Text("Gniazdo 6"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 6",
                    endpoint: "${selectedController?.id}/soc6");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: const Icon(Icons.electrical_services),
              title: const Text("Gniazdo 7"),
              enabled: isOnline,
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 7",
                    endpoint: "${selectedController?.id}/soc7");
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            const Divider(),
                  ListTile(
              leading: const Icon(
                  Icons.change_circle), // Choose an appropriate icon
              title: const Text("Zmień sterownik"),
              onTap: () {
                context.goNamed(
                  ChooseControllerPage.pageConfig.name,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: const Text("Zmień sterownik"),
              onTap: () {
                Navigator.of(context).pop();
                context.pushNamed(ChooseControllerPage.pageConfig.name);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.sensors),
              title: const Text("Konfiguracja czujników DS18B20"),
              onTap: () {
                Navigator.of(context).pop();
                context.pushNamed(ScanSensorsPage.pageConfig.name);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                  Icons.login_outlined), // Choose an appropriate icon
              title: const Text("Wyloguj"),
              onTap: () {
                ref.read(homePageViewmodelProvider.notifier).logout();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: AdaptiveLayout(
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('primary-navigation-medium'),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                trailing: IconButton(
                    onPressed: () {
                      context.pushNamed("/setup_page");
                    },
                    icon: const Icon(Icons.settings)),
                onDestinationSelected: (index) =>
                    _tapOnNavigationDestination(context, index),
                selectedIndex: widget.index,
                destinations: destinations
                    .map(
                      (_) => AdaptiveScaffold.toRailDestination(_),
                    )
                    .toList(),
              ),
            ),
          },
        ),
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key("bottom-navigation-small"),
              builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                destinations: destinations,
                onDestinationSelected: (index) =>
                    _tapOnNavigationDestination(context, index),
                currentIndex: widget.index,
              ),
            ),
          },
        ),
        body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
              key: const Key("primary-body-small"),
              builder: (_) => HomePage.tabs[widget.index].child)
        }),
        secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('secondary-body-medium'),
              builder: AdaptiveScaffold.emptyBuilder)
        }),
      )),
    );
  }

  void _tapOnNavigationDestination(BuildContext context, int index) =>
      context.goNamed(
        HomePage.pageConfig.name,
        pathParameters: {
          'tab': HomePage.tabs[index].name,
        },
      );
}

final destinations = HomePage.tabs
    .map(
      (page) => NavigationDestination(icon: Icon(page.icon), label: page.name),
    )
    .toList();
