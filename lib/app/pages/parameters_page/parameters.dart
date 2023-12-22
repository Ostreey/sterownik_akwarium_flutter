import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/domain/models/parameters_edit_page_model/parameters_edit_page_model.dart';
import 'package:sterownik_akwarium/app/domain/models/sensor_model/sensor_model.dart';
import 'package:sterownik_akwarium/app/pages/parameters_edit/parameters_edit.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/widgets/gauge_container.dart';
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
    const String deviceNumber = "001";

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.3,
            children: [
              GestureDetector(
                  onTap: () {
                    final model = ParametersEditPageModel(
                        appBarTitle: "Temperatura wody",
                        endpoint: "$deviceNumber/water_temp",
                        minValue: sensorData.waterTempMin,
                        maxValue: sensorData.waterTempMax,
                        currentValue: sensorData.waterTemp,
                        unit: "'C");
                    context.pushNamed(ParametersEditPage.pageConfig.name,
                        extra: model);
                  },
                  child: GaugeContainer(
                    labelName: "Temperatura wody",
                    currentValue: sensorData.waterTemp,
                    minAlarmValue: sensorData.waterTempMin,
                    maxAlarmValue: sensorData.waterTempMax,
                    unit: "'C",
                  )),
              GestureDetector(
                onTap: () {
                  final model = ParametersEditPageModel(
                      appBarTitle: "Temperatura powietrza",
                      endpoint: "$deviceNumber/air_temp",
                      minValue: sensorData.airTempMin,
                      maxValue: sensorData.airTempMax,
                      currentValue: sensorData.airTemp,
                      unit: "'C");
                  context.pushNamed(ParametersEditPage.pageConfig.name,
                      extra: model);
                },
                child: GaugeContainer(
                  labelName: "Temp powietrza",
                  currentValue: sensorData.airTemp,
                  minAlarmValue: sensorData.airTempMin,
                  maxAlarmValue: sensorData.airTempMax,
                  unit: "'C",
                ),
              ),
              GestureDetector(
                  onTap: () {
                    final model = ParametersEditPageModel(
                        appBarTitle: "pH",
                        endpoint: "$deviceNumber/pH",
                        minValue: sensorData.phMin,
                        maxValue: sensorData.phMax,
                        currentValue: sensorData.ph,
                        unit: "");
                    context.pushNamed(ParametersEditPage.pageConfig.name,
                        extra: model);
                  },
                  child: GaugeContainer(
                    labelName: "pH",
                    currentValue: sensorData.ph,
                    minAlarmValue: sensorData.phMin,
                    maxAlarmValue: sensorData.phMax,
                    unit: "",
                  )),
              GestureDetector(
                  onTap: () {
                    final model = ParametersEditPageModel(
                        appBarTitle: "TDS",
                        endpoint: "$deviceNumber/tds",
                        minValue: sensorData.tdsMin,
                        maxValue: sensorData.tdsMax,
                        currentValue: sensorData.tds,
                        unit: "");
                    context.pushNamed(ParametersEditPage.pageConfig.name,
                        extra: model);
                  },
                  child: GaugeContainer(
                    labelName: "TDS",
                    currentValue: sensorData.tds,
                    minAlarmValue: sensorData.tdsMin,
                    maxAlarmValue: sensorData.tdsMax,
                    unit: "",
                  )),
              GestureDetector(
                  onTap: () {
                    final model = ParametersEditPageModel(
                        appBarTitle: "Co2",
                        endpoint: "$deviceNumber/co2",
                        minValue: sensorData.co2Min,
                        maxValue: sensorData.co2Max,
                        currentValue: sensorData.co2,
                        unit: "");
                    context.pushNamed(ParametersEditPage.pageConfig.name,
                        extra: model);
                  },
                  child: GaugeContainer(
                    labelName: "Co2",
                    currentValue: sensorData.co2,
                    minAlarmValue: sensorData.co2Min,
                    maxAlarmValue: sensorData.co2Max,
                    unit: "",
                  )),
              GestureDetector(
                  onTap: () {
                    final model = ParametersEditPageModel(
                        appBarTitle: "Przepływomierz",
                        endpoint: "$deviceNumber/water_flow",
                        minValue: sensorData.waterFlowMin,
                        maxValue: sensorData.waterFlowMax,
                        currentValue: sensorData.waterFlow,
                        unit: "L/H");
                    context.pushNamed(ParametersEditPage.pageConfig.name,
                        extra: model);
                  },
                  child: GaugeContainer(
                    labelName: "Przepływomierz",
                    currentValue: sensorData.waterFlow,
                    minAlarmValue: sensorData.waterFlowMin,
                    maxAlarmValue: sensorData.waterFlowMax,
                    unit: "",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
