import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/domain/models/device_state/device_state_model.dart';
import 'package:sterownik_akwarium/app/pages/change_socket_name/change_socket_name.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/widgets/led_state.dart';
import 'package:sterownik_akwarium/app/pages/widgets/circular_icon.dart';

import '../../domain/models/sensor_model/sensor_model.dart';
import '../parameters_page/mqtt_provider.dart';
import 'widgets/cicrulation_section.dart';
import 'widgets/pumps_section.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      List<String> tmpSocketName = List.generate(numberOfSockets, (index) => 'Nazwa gniazda');
      await prefs.setStringList('socket_names', tmpSocketName);
    } else {
      setState(() {
        socketName = savedNames;
        socketName.forEach((socketName) {
          socketName = socketName.isNotEmpty ? socketName : 'Nazwa gniazda';
        });
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
            padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PumpsSection(),
                SizedBox(height: 27,),
                CirculationSection(),
                SizedBox(height: 27,),
                LedState(),
                SizedBox(height: 27,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Gniazda", style: textTheme!.titleLarge),
                        SizedBox(width: 5,),
                        GestureDetector(
                            child: Icon(Icons.edit_outlined, color: colorTheme.primary),
                            onTap: (){
                              context.pushNamed(ChangeSocketName.pageConfig.name, extra: socketName).then((value) => setState(() {
                                socketName = value  as List<String>;
                              }));
                            }
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    DeviceStateLongWidget(state: true,
                        labelName:socketName[0]
                    ),
                    SizedBox(height: 7,),
                    DeviceStateLongWidget(state: false,
                        labelName:socketName[1]
                    ),
                    SizedBox(height: 7,),
                    DeviceStateLongWidget(state: false,
                        labelName:socketName[2]
                    ),
                    SizedBox(height: 7,),
                    DeviceStateLongWidget(state: true,
                        labelName:socketName[3]
                    ),
                    SizedBox(height: 7,),
                    DeviceStateLongWidget(state: true,
                        labelName:socketName[4]
                    ),
                    SizedBox(height: 7,),
                    DeviceStateLongWidget(state: true,
                        labelName:socketName[5]
                    ),
                    SizedBox(height: 7,),
                    DeviceStateLongWidget(state: true,
                        labelName:socketName[6]
                    ),
                    SizedBox(height: 7,),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}


class DeviceStateLongWidget extends StatelessWidget {
  const DeviceStateLongWidget({
    super.key, required this.state, required this.labelName,
  });

  final bool state;
  final String labelName;
  @override
  Widget build(BuildContext context) {
    final  colorTheme = Theme.of(context).colorScheme;
    final  textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: colorTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: colorTheme.outlineVariant),
      ),
      child: Row(
        children: [
          Text(labelName, style: textTheme.titleLarge!.copyWith(color: colorTheme.primary)),
         Spacer(),
         Icon(state ? Icons.check : Icons.cancel_outlined,
              color: state ? Colors.green : Colors.red,
              size: 35,),
        ],
      ),
    );
  }
}


