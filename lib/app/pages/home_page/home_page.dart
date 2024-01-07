import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_page_model/timer_page_model.dart';
import 'package:sterownik_akwarium/app/pages/alarms_page/alarms.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_page.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';

import '../devices_page/devices.dart';
import '../parameters_page/parameters.dart';
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
  static const String deviceNumber = "001";
  @override
  Widget build(BuildContext context) {
    SensorModel sensorData = SensorModel();
    final sensorDataAsyncValue = ref.watch(mqttUpdatesProvider);
    sensorDataAsyncValue.whenData((value) => sensorData = value);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Podłączony"),
            Spacer(),
            Icon(
              Icons.wifi,
              color: Colors.green,
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
                  Spacer(),
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
              leading: Icon(Icons.heat_pump_outlined),
              // Choose an appropriate icon
              title: Text("Pompa 1"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 1",
                    endpoint: "$deviceNumber/pump1",
                    timerDeviceModel: sensorData.pompa1);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.heat_pump_outlined),
              // Choose an appropriate icon
              title: Text("Pompa 2"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Pompa 2",
                    endpoint: "$deviceNumber/pump2",
                    timerDeviceModel: sensorData.pompa2);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.water_drop),
              // Choose an appropriate icon
              title: Text("Cyrkulacja 1"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Cyrkulacja 1",
                    endpoint: "$deviceNumber/circul1",
                    timerDeviceModel: sensorData.circul1);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),

            ListTile(
              leading: Icon(Icons.water_drop),
              // Choose an appropriate icon
              title: Text("Cyrkulacja 2"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Cyrkulacja 2",
                    endpoint: "$deviceNumber/circul2",
                    timerDeviceModel: sensorData.circul2);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb),
              // Choose an appropriate icon
              title: Text("LED"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "LED",
                    endpoint: "$deviceNumber/led",
                    timerDeviceModel: sensorData.led);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: Text("Gniazdo 1"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 1",
                    endpoint: "$deviceNumber/soc1",
                    timerDeviceModel: sensorData.soc1);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: Text("Gniazdo 2"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 2",
                    endpoint: "$deviceNumber/soc2",
                    timerDeviceModel: sensorData.soc2);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: Text("Gniazdo 3"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 3",
                    endpoint: "$deviceNumber/soc3",
                    timerDeviceModel: sensorData.soc3);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: Text("Gniazdo 4"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 4",
                    endpoint: "$deviceNumber/soc4",
                    timerDeviceModel: sensorData.soc4);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: Text("Gniazdo 5"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 5",
                    endpoint: "$deviceNumber/soc5",
                    timerDeviceModel: sensorData.soc5);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: Text("Gniazdo 6"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 6",
                    endpoint: "$deviceNumber/soc6",
                    timerDeviceModel: sensorData.soc6);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            ListTile(
              leading: Icon(Icons.electrical_services),
              // Choose an appropriate icon
              title: Text("Gniazdo 7"),
              onTap: () {
                final model = TimerPageModel(
                    appBarTitle: "Gniazdo 7",
                    endpoint: "$deviceNumber/soc7",
                    timerDeviceModel: sensorData.soc7);
                context.pushNamed(TimerPage.pageConfig.name, extra: model);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.login_outlined), // Choose an appropriate icon
              title: Text("Wyloguj"),
              onTap: () {
                // Handle tap
              },
            ),
            // Add more ListTile widgets for other drawer items
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
                    icon: Icon(Icons.settings)),
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
