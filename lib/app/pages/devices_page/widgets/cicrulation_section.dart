
import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/widgets/device_state_short.dart';

class CirculationSection extends StatelessWidget {
  const CirculationSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final  textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Cyrkulacja", style: textTheme!.titleLarge,),
        SizedBox(height: 15,),
        Row(
          children: [
            DeviceStateShortWidget(value:"50%", state: true, labelName: '1',),
            Spacer(),
            DeviceStateShortWidget(value: '70%', state: false, labelName: '2',),
          ],
        ),
      ],
    );
  }
}