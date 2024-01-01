import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/device_state/device_state_model.dart';

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
    @Default(DeviceStateModel()) DeviceStateModel pompa1,
    @Default(DeviceStateModel()) DeviceStateModel pompa2,
    @Default(DeviceStateModel()) DeviceStateModel circulation1,
    @Default(DeviceStateModel()) DeviceStateModel circulation2,
    @Default(DeviceStateModel()) DeviceStateModel led,
    @Default(false) bool socket1,
    @Default(false) bool socket2,
    @Default(false) bool socket3,
    @Default(false) bool socket4,
    @Default(false) bool socket5,
    @Default(false) bool socket6,
    @Default(false) bool socket7,
  }) = _SensorModel;

  factory SensorModel.fromJson(Map<String, dynamic> json) =>
      _$SensorModelFromJson(json);
}
