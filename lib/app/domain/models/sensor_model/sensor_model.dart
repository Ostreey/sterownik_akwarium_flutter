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
    @Default(0.0) double ph,
    @Default(0.0) double phMin,
    @Default(0.0) double phMax,
    @Default(0.0) double tds,
    @Default(0.0) double tdsMin,
    @Default(0.0) double tdsMax,
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
  }) = _SensorModel;

  factory SensorModel.fromJson(Map<String, dynamic> json) =>
      _$SensorModelFromJson(json);
}
