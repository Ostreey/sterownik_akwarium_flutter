
import 'package:flutter/material.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';
import 'package:sterownik_akwarium/app/pages/widgets/label.dart';

class GaugeContainer extends StatelessWidget {
  GaugeContainer({
    super.key,
    required this.labelName,
    required this.currentValue,
    required this.minAlarmValue,
    required this.maxAlarmValue,
    this.unit = '',
  });

  final String labelName;
  final double currentValue;
  final double minAlarmValue;
  final double maxAlarmValue;
  String? unit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: theme.outlineVariant),
      ),
      child: Column(
        children: [
          Label(label: labelName),
          Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Gauge(
                  currentValue: currentValue,
                  minAlarmValue: minAlarmValue,
                  maxAlarmValue: maxAlarmValue,
                  unit: unit!)),
        ],
      ),
    );
  }
}
