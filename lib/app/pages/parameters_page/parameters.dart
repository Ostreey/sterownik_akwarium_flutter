import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/app/pages/parameters_edit/parameters_edit.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';

import '../../core/page_config.dart';
import '../timer_page/timer_page.dart';
import '../widgets/label.dart';
import 'mqtt_provider.dart';

class Parameters extends ConsumerWidget {
  const Parameters({Key? key}) : super(key: key);

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.bar_chart,
    name: 'Parametry',
    child: Parameters(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    SensorModel sensorData = SensorModel();
    final sensorDataAsyncValue = ref.watch(mqttUpdatesProvider);
    sensorDataAsyncValue.whenData((value) => sensorData = value);


    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          child:
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.3,
            children: [
              GestureDetector(
                  onTap: () {
                    context.pushNamed(ParametersEditPage.pageConfig.name);
                  },
                  child: ParameterWidget(labelName: "Temp. wody", currentValue: sensorData.waterTemp, minAlarmValue: sensorData.waterTempMin, maxAlarmValue: sensorData.waterTempMax, unit: "'C",)),
              ParameterWidget(labelName: "Temo. powietrza", currentValue: sensorData.airTemp, minAlarmValue: sensorData.airTempMin, maxAlarmValue: sensorData.airTempMax, unit: "'C",),
              ParameterWidget(labelName: "pH", currentValue: sensorData.ph, minAlarmValue: sensorData.phMin, maxAlarmValue: sensorData.phMax),
              ParameterWidget(labelName: "TDS", currentValue: sensorData.tds, minAlarmValue: sensorData.tdsMin, maxAlarmValue: sensorData.tdsMax, unit: ' ppm',),
              ParameterWidget(labelName: "CO2", currentValue: sensorData.co2, minAlarmValue: sensorData.co2Min, maxAlarmValue: sensorData.co2Max),
              ParameterWidget(labelName: "Przepływomierz", currentValue: sensorData.waterFlow, minAlarmValue: sensorData.waterFlowMin, maxAlarmValue: sensorData.waterFlowMax, unit: ' L/h',),
            ],
          ),

        ),
      ),
    );
  }
}

class ParameterWidget extends StatelessWidget {
   ParameterWidget({
    super.key,
    required this.labelName,
    required this.currentValue,
    required this.minAlarmValue,
    required this.maxAlarmValue,
    this.unit = '',
  });

  final String labelName;
  final  double currentValue;
  final  double minAlarmValue;
  final  double maxAlarmValue;
  String? unit;

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
              child: Gauge(currentValue: currentValue, minAlarmValue: minAlarmValue, maxAlarmValue: maxAlarmValue, unit: unit!)
          ),
        ],
      ),
    );
  }
}