import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/widgets/led_state.dart';
import 'package:sterownik_akwarium/app/pages/widgets/circular_icon.dart';

import 'widgets/cicrulation_section.dart';
import 'widgets/pumps_section.dart';

class Devices extends StatelessWidget {
  const Devices({super.key});

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.electrical_services,
    name: 'Urządzenia',
    child: Devices(),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
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
                  Icon(Icons.edit_outlined,color: colorTheme.primary)
                ],
              ),
            SizedBox(height: 15,),
            DeviceStateLongWidget(state: true, labelName: 'Nazwa gniazda',),
              SizedBox(height: 7,),
              DeviceStateLongWidget(state: false, labelName: 'Nazwa gniazda',),
              SizedBox(height: 7,),
              DeviceStateLongWidget(state: true, labelName: 'Nazwa gniazda',),
              SizedBox(height: 7,),
              DeviceStateLongWidget(state: false, labelName: 'Nazwa gniazda',),
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


