
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/widgets/device_state_short.dart';

class CirculationSection extends ConsumerWidget {
  const CirculationSection({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(devicesProvider);
    final  textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Cyrkulacja", style: textTheme!.titleLarge,),
        SizedBox(height: 15,),
        Row(
          children: [
            DeviceStateShortWidget(value:devices.circulation1.speed.toString(), state: devices.circulation1.state, labelName: '1',),
            Spacer(),
            DeviceStateShortWidget(value: devices.circulation2.speed.toString(), state: devices.circulation2.state, labelName: '2',),
          ],
        ),
      ],
    );
  }
}