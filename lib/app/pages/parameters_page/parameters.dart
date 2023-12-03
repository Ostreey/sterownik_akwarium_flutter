import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';



import '../../core/page_config.dart';
import '../widgets/label.dart';

class Parameters extends StatelessWidget {
  const Parameters({super.key});

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.bar_chart,
    name: 'Parametry',
    child: Parameters(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width / 20),
      child: Column(
        children: [
          Container(
            width: size.width ,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: theme.outlineVariant),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                    child: Gauge(currentValue: 29.3, minAlarmValue: 29, maxAlarmValue: 31)
                ),
                Positioned(
                  top: 0,
                  left: size.width * 0.33,
                    child: Label(label: "Temperatura",)
                ),
                SizedBox(
                  width: 12,
                ),

              ],
            ),
          )
        ],
      ),
    )));
  }
}



class CircularIcon extends StatelessWidget {
  final IconData iconData;

  const CircularIcon({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 40, // Adjust width and height as needed for your icon size
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.primary, // Blue background color for the circle
      ),
      child: Center(
        child: Icon(
          iconData,
          color: Colors.white, // Color of the icon
          size: 24, // Size of the icon
        ),
      ),
    );
  }
}
/*
class Gauge extends StatelessWidget {
  const Gauge({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return  SfRadialGauge(axes:
    <RadialAxis>[
        RadialAxis(
            minimum: 0,
            maximum: 100,
         *//*   labelsPosition: ElementsPosition.outside,
            ticksPosition: ElementsPosition.outside,*//*
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 25,
                  color: themeColor.errorContainer,
                  startWidth: 10,
                  endWidth: 10),
              GaugeRange(
                  startValue: 25,
                  endValue: 35,
                  color: themeColor.inversePrimary,
                  startWidth: 10,
                  endWidth: 10),
              GaugeRange(
                  startValue: 35,
                  endValue: 100,
                  color: themeColor.errorContainer,
                  startWidth: 10,
                  endWidth: 10)
            ],
            pointers: <GaugePointer>[
              MarkerPointer(
                value: 90,
                markerWidth: 15,
                markerHeight: 15,
                markerOffset: -12,
                color: themeColor.primary,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: Text('90.0',
                          style: textTheme.bodySmall!
                              .copyWith(color: themeColor.primary))),
                  angle: 90,
                  positionFactor: 0.5)
            ])
      ])
    ;
  }
}*/

