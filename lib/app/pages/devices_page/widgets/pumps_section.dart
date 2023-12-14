
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/devices_provider.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/widgets/device_state_short.dart';

class PumpsSection extends ConsumerWidget {
  const PumpsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final devices = ref.watch(devicesProvider);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pompy", style: textTheme!.titleLarge,),
        SizedBox(height: 15,),
        Row(
          children: [
            DeviceStateShortWidget(value:devices.pompa1.speed.toString(), state: devices.pompa1.state, labelName: '1',),
            Spacer(),
            DeviceStateShortWidget(value:devices.pompa2.speed.toString(), state: devices.pompa2.state, labelName: '2',),
          ],
        ),
      ],
    );
  }
}