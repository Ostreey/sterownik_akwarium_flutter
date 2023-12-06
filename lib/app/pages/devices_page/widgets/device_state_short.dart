

import 'package:flutter/material.dart';

import '../../widgets/circular_icon.dart';

class DeviceStateShortWidget extends StatelessWidget {
  const DeviceStateShortWidget({
    super.key, required this.value, required this.state, required this.labelName,
  });

  final String value;
  final String labelName;
  final bool state;
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final  textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: colorTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: colorTheme.outlineVariant),
      ),
      child: Row(
        children: [
          CircularIcon(labelName:labelName,),
          SizedBox(width: 9,),
          Text(value, style: textTheme.titleLarge!.copyWith(color: colorTheme.primary)),
          SizedBox(width: 9,),
          Icon(state? Icons.check : Icons.cancel_outlined,
            color: state ? Colors.green : Colors.red,
            size: 35,)
        ],
      ),
    );
  }
}