import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:sterownik_akwarium/app/domain/models/mqtt_model.dart';
import 'package:sterownik_akwarium/app/pages/widgets/gauge.dart';



import '../../core/page_config.dart';
import '../widgets/label.dart';
import 'mqtt_provider.dart';
import 'parameters_provider.dart';

class Parameters extends ConsumerWidget {
  const Parameters({Key? key}) : super(key: key);

  static final PageConfig pageConfig = PageConfig(
    icon: Icons.bar_chart,
    name: 'Parametry',
    child: Parameters(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    SensorModel sensorData = SensorModel(waterTemp: 0, waterTempMin: 0, waterTempMax: 0, airTemp: 0, airTempMin: 0, airTempMax: 0, ph: 0, phMin: 0, phMax: 0, tds: 0, tdsMin: 0, tdsMax: 0);
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
              ParameterWidget(labelName: "Temp. wody", currentValue: sensorData.waterTemp, minAlarmValue: sensorData.waterTempMin, maxAlarmValue: sensorData.waterTempMax),
              ParameterWidget(labelName: "Temo. powietrza", currentValue: sensorData.airTemp, minAlarmValue: sensorData.airTempMin, maxAlarmValue: sensorData.airTempMax),
              ParameterWidget(labelName: "pH", currentValue: sensorData.ph, minAlarmValue: sensorData.phMin, maxAlarmValue: sensorData.phMax),
              ParameterWidget(labelName: "TDS", currentValue: sensorData.tds, minAlarmValue: sensorData.tdsMin, maxAlarmValue: sensorData.tdsMax),

              ParameterWidget(labelName: "CO2", currentValue: 25.3, minAlarmValue: 24.0, maxAlarmValue: 26.0),
              ParameterWidget(labelName: "Przepływomierz", currentValue: 23.3, minAlarmValue: 21.3, maxAlarmValue: 25.3),
            ],
          ),

        ),
      ),
    );
  }
}

class ParameterWidget extends StatelessWidget {
  const ParameterWidget({
    super.key, required this.labelName, required this.currentValue, required this.minAlarmValue, required this.maxAlarmValue,
  });

  final String labelName;
  final  currentValue;
  final  minAlarmValue;
  final  maxAlarmValue;

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
              child: Gauge(currentValue: currentValue, minAlarmValue: minAlarmValue, maxAlarmValue: maxAlarmValue)
          ),
        ],
      ),
    );
  }
}