
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class Gauge extends StatelessWidget {
  const Gauge({Key? key, required this.currentValue, required this.minAlarmValue, required this.maxAlarmValue}) : super(key: key);

  Color getValidValueColor(ColorScheme themeColor) {
    return themeColor.inversePrimary;
  }

  Color getAlarmValueColor(ColorScheme themeColor) {
    return themeColor.errorContainer;
  }

  Color getPointerColor(ColorScheme themeColor) {
    return themeColor.primary;
  }

  final double currentValue;
  final double minAlarmValue;
  final double maxAlarmValue;
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final midValue = (minAlarmValue + maxAlarmValue) / 2;
    final double minRange = midValue - 3;
    final double maxRange = midValue + 3;
    return Stack(
      children: [
        Container(
          width: 140,
          child: AnimatedRadialGauge(
            duration: const Duration(seconds: 1),
            curve: Curves.elasticOut,
            radius: 100,
            value: currentValue,
            axis: GaugeAxis(
              min: minRange,
              max: maxRange,
              degrees: 180,
              style: const GaugeAxisStyle(
                thickness: 20,
                background: Colors.white,
                segmentSpacing: 2,
              ),
              pointer: GaugePointer.triangle(
                color: themeColor.primary,
                width: 20,
                height: 20,
                position: const GaugePointerPosition(
                  anchor: GaugePointerAnchor.surface,
                  offset: Offset(10, 10),
                ),
              ),
              progressBar: const GaugeProgressBar.rounded(color: Colors.transparent),
              segments: [
                GaugeSegment(
                  from: minRange,
                  to: minAlarmValue,
                  color: getAlarmValueColor(themeColor),
                  cornerRadius: Radius.zero,
                ),
                GaugeSegment(
                  from: minAlarmValue,
                  to: maxAlarmValue,
                  color: getValidValueColor(themeColor), // Use the function to get color dynamically
                  cornerRadius: Radius.zero,
                ),
                GaugeSegment(
                  from: maxAlarmValue,
                  to: maxRange,
                  color: getAlarmValueColor(themeColor),
                  cornerRadius: Radius.zero,
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              currentValue.toString() + "'C",
              style: textTheme.titleLarge!.copyWith(color: themeColor.primary), // Adjust text style as needed
            ),
          ),
        ),
      ],
    );
  }
}
