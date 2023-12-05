import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';



import '../../core/page_config.dart';
import '../widgets/label.dart';

class Parameters extends StatelessWidget {
  const Parameters({Key? key}) : super(key: key);

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
          child:
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10, // Spacing between columns
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.3, // Spacing between rows
                children: [
                  ParameterWidget(labelName: "Temp. wody", currentValue: 29.3),
                  ParameterWidget(labelName: "Temo. powietrza", currentValue: 29.3),
                  ParameterWidget(labelName: "pH", currentValue: 29.3),
                  ParameterWidget(labelName: "TDS", currentValue: 29.3),
                  ParameterWidget(labelName: "CO2", currentValue: 29.3),
                  ParameterWidget(labelName: "Przepływomierz", currentValue: 29.3),
                ],
              ),

        ),
      ),
    );
  }
}

class ParameterWidget extends StatelessWidget {
  const ParameterWidget({
    super.key, required this.labelName, required this.currentValue,
  });

  final String labelName;
  final double currentValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45 ,
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
              child: Gauge(currentValue: currentValue, minAlarmValue: 29, maxAlarmValue: 31)
          ),
        ],
      ),
    );
  }
}


