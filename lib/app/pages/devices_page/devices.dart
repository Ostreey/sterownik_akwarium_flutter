import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/change_socket_name/change_socket_name.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/widgets/led_state.dart';

import 'widgets/cicrulation_section.dart';
import 'widgets/pumps_section.dart';

class Devices extends ConsumerStatefulWidget {
  const Devices({Key? key}) : super(key: key);

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'Urządzenia',
    child: Devices(),
  );

  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends ConsumerState<Devices> {
  late List<String> socketName = [];

  int numberOfSockets = 7;

  @override
  void initState() {
    super.initState();
    socketName = List.generate(numberOfSockets, (index) => 'Nazwa gniazda');
    _loadNamesFromPrefs();
    debugPrint("FROM PREVIOUS");
  }

  Future<void> _loadNamesFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedNames = prefs.getStringList('socket_names');

    if (savedNames == null) {
      List<String> tmpSocketName =
          List.generate(numberOfSockets, (index) => 'Nazwa gniazda');
      await prefs.setStringList('socket_names', tmpSocketName);
    } else {
      setState(() {
        socketName = savedNames;
        for (var socketName in socketName) {
          socketName = socketName.isNotEmpty ? socketName : 'Nazwa gniazda';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    final devices = ref.watch(devicesProvider);

    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PumpsSection(),
            const SizedBox(
              height: 27,
            ),
            const CirculationSection(),
            const SizedBox(
              height: 27,
            ),
            const LedState(),
            const SizedBox(
              height: 27,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Gniazda", style: textTheme.titleLarge),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        child: Icon(Icons.edit_outlined,
                            color: colorTheme.primary),
                        onTap: () {
                          context
                              .pushNamed(ChangeSocketName.pageConfig.name,
                                  extra: socketName)
                              .then((value) => setState(() {
                                    socketName = value as List<String>;
                                  }));
                        }),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                DeviceStateLongWidget(
                    state: devices.socket1, labelName: socketName[0]),
                const SizedBox(
                  height: 7,
                ),
                DeviceStateLongWidget(
                    state: devices.socket2, labelName: socketName[1]),
                const SizedBox(
                  height: 7,
                ),
                DeviceStateLongWidget(
                    state: devices.socket3, labelName: socketName[2]),
                const SizedBox(
                  height: 7,
                ),
                DeviceStateLongWidget(
                    state: devices.socket4, labelName: socketName[3]),
                const SizedBox(
                  height: 7,
                ),
                DeviceStateLongWidget(
                    state: devices.socket5, labelName: socketName[4]),
                const SizedBox(
                  height: 7,
                ),
                DeviceStateLongWidget(
                    state: devices.socket6, labelName: socketName[5]),
                const SizedBox(
                  height: 7,
                ),
                DeviceStateLongWidget(
                    state: devices.socket7, labelName: socketName[6]),
                const SizedBox(
                  height: 7,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class DeviceStateLongWidget extends StatelessWidget {
  const DeviceStateLongWidget({
    super.key,
    required this.state,
    required this.labelName,
  });

  final bool state;
  final String labelName;
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: colorTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: colorTheme.outlineVariant),
      ),
      child: Row(
        children: [
          Text(labelName,
              style: textTheme.titleLarge!.copyWith(color: colorTheme.primary)),
          const Spacer(),
          Icon(
            state ? Icons.check : Icons.cancel_outlined,
            color: state ? Colors.green : Colors.red,
            size: 35,
          ),
        ],
      ),
    );
  }
}
