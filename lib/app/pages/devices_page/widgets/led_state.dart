import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/pages/devices_page/widgets/device_state_short.dart';

class LedState extends StatelessWidget {
  const LedState({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LED",
          style: textTheme.titleLarge,
        ),
        const SizedBox(
          height: 15,
        ),
        const Row(
          children: [
            DeviceStateShortWidget(
              value: "",
              state: true,
              labelName: '1',
            ),
          ],
        ),
      ],
    );
  }
}
