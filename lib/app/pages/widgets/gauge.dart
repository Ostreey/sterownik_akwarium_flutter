
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class Gauge extends StatelessWidget {
  const Gauge({Key? key, required this.currentValue, required this.minAlarmValue, required this.maxAlarmValue, required this.unit, this.size}) : super(key: key);

  Color getValidValueColor(ColorScheme themeColor) {
    return themeColor.inversePrimary;
  }

  Color getAlarmValueColor(ColorScheme themeColor) {
    return themeColor.errorContainer;
  }

  Color getPointerColor(ColorScheme themeColor) {
    return themeColor.primary;
  }

  String parseCurentValue(double value) {
    String parsedValue;
    value  > 100 ? parsedValue = value.toStringAsFixed(0) : parsedValue = value.toString();
    return parsedValue;
  }

  final double currentValue;
  final double minAlarmValue;
  final double maxAlarmValue;
  final String unit;
  final double? size;
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final double minRange = minAlarmValue * 0.9;
    final double maxRange = maxAlarmValue * 1.1;
    return Stack(
      children: [
        Container(
           width: size ?? 140,
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
                  offset: Offset(0, 11),
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
                  color: getValidValueColor(themeColor),
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
              parseCurentValue(currentValue) + unit,
              style: ((currentValue > minAlarmValue) && (currentValue < maxAlarmValue)) ? textTheme.titleLarge!.copyWith(color: themeColor.primary) : textTheme.titleLarge!.copyWith(color: themeColor.error),    // Adjust text style as needed
            ),
          ),
        ),
      ],
    );
  }
}
