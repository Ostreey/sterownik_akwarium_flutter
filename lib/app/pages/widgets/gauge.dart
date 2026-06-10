import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class Gauge extends StatelessWidget {
  const Gauge({
    Key? key,
    required this.currentValue,
    required double minAlarmValue,
    required double maxAlarmValue,
    required this.unit,
    this.size,
  })  : minAlarmValue = minAlarmValue < 0 ? 0 : minAlarmValue,
        maxAlarmValue = maxAlarmValue < 0 ? 100 : maxAlarmValue,
        super(key: key);

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
    value > 100
        ? parsedValue = value.toStringAsFixed(0)
        : parsedValue = value.toString();
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

    // Wartosci alarmowe moga przyjsc w dowolnej kolejnosci: dla temp. WODY
    // (grzanie) min < max, ale dla temp. POWIETRZA (chlodzenie) logika jest
    // odwrocona i min > max. Gauge wymaga osi min < max, inaczej gauge_indicator
    // rzuca "Invalid argument(s)". Dlatego sortujemy na lo/hi - zielona strefa
    // "ok" jest miedzy nimi niezaleznie od kolejnosci.
    final double lo =
        minAlarmValue < maxAlarmValue ? minAlarmValue : maxAlarmValue;
    final double hi =
        minAlarmValue < maxAlarmValue ? maxAlarmValue : minAlarmValue;
    final double minRange = lo * 0.9;
    // Zabezpieczenie: gdy lo==hi (lub po skalowaniu max<=min) wymus minimalny
    // rozjazd osi, zeby gauge mial poprawny zakres.
    final double maxRange = (hi * 1.1) > minRange ? (hi * 1.1) : minRange + 1;
    // Wskaznik musi miescic sie w osi - inaczej tez wyjatek (np. odczyt-smiec
    // przy odlaczonym czujniku). Tekst i tak pokazuje realny currentValue.
    final double pointerValue = currentValue.clamp(minRange, maxRange);
    return Stack(
      children: [
        SizedBox(
          width: size ?? 140,
          child: AnimatedRadialGauge(
            duration: const Duration(seconds: 1),
            curve: Curves.elasticOut,
            radius: 100,
            value: pointerValue,
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
              progressBar:
                  const GaugeProgressBar.rounded(color: Colors.transparent),
              segments: [
                GaugeSegment(
                  from: minRange,
                  to: lo,
                  color: getAlarmValueColor(themeColor),
                  cornerRadius: Radius.zero,
                ),
                GaugeSegment(
                  from: lo,
                  to: hi,
                  color: getValidValueColor(themeColor),
                  cornerRadius: Radius.zero,
                ),
                GaugeSegment(
                  from: hi,
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
              style: ((currentValue > lo) && (currentValue < hi))
                  ? textTheme.titleLarge!.copyWith(color: themeColor.primary)
                  : textTheme.titleLarge!.copyWith(
                      color: themeColor.error), // Adjust text style as needed
            ),
          ),
        ),
      ],
    );
  }
}
