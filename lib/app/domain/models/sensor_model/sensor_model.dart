import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sterownik_akwarium/app/domain/models/output_status_model/output_status_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';

part 'sensor_model.freezed.dart';
part 'sensor_model.g.dart';

@freezed
class SensorModel with _$SensorModel {
  const factory SensorModel({
    @Default(0.0) double waterTemp,
    @Default(0.0) double waterTempMin,
    @Default(0.0) double waterTempMax,
    @Default(0.0) double airTemp,
    @Default(0.0) double airTempMin,
    @Default(0.0) double airTempMax,
    @Default(0) int airTempFreq,
    @Default(0.0) double ph,
    @Default(0.0) double phSet,
    @Default(0.0) double phHisteresis,
    @Default(0.0) double tds,
    @Default(0.0) double tdsSet,
    @Default(0.0) double tdsHisteresis,
    @Default(0.0) double co2,
    @Default(0.0) double co2Min,
    @Default(0.0) double co2Max,
    @Default(0.0) double waterFlow,
    @Default(0.0) double waterFlowMin,
    @Default(0.0) double waterFlowMax,
    @Default(TimerDeviceModel()) TimerDeviceModel pompa1,
    @Default(TimerDeviceModel()) TimerDeviceModel pompa2,
    @Default(TimerDeviceModel()) TimerDeviceModel circul1,
    @Default(TimerDeviceModel()) TimerDeviceModel circul2,
    @Default(TimerDeviceModel()) TimerDeviceModel led,
    @Default(TimerDeviceModel()) TimerDeviceModel soc1,
    @Default(TimerDeviceModel()) TimerDeviceModel soc2,
    @Default(TimerDeviceModel()) TimerDeviceModel soc3,
    @Default(TimerDeviceModel()) TimerDeviceModel soc4,
    @Default(TimerDeviceModel()) TimerDeviceModel soc5,
    @Default(TimerDeviceModel()) TimerDeviceModel soc6,
    @Default(TimerDeviceModel()) TimerDeviceModel soc7,
    // Faza 4: grupa 001/state/system — stany grzałek/wentylatorów + alarmy.
    @Default(OutputStatusModel()) OutputStatusModel heater1,
    @Default(OutputStatusModel()) OutputStatusModel heater2,
    @Default(OutputStatusModel()) OutputStatusModel fan1,
    @Default(OutputStatusModel()) OutputStatusModel fan2,
  }) = _SensorModel;

  factory SensorModel.fromJson(Map<String, dynamic> json) =>
      _$SensorModelFromJson(json);
}
