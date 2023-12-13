import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqtt_model.freezed.dart';
part 'mqtt_model.g.dart';


@freezed
class SensorModel with _$SensorModel {
  const factory SensorModel({
    required double waterTemp,
    required double waterTempMin,
    required double waterTempMax,
    required double airTemp,
    required double airTempMin,
    required double airTempMax,
    required double ph,
    required double phMin,
    required double phMax,
    required double tds,
    required double tdsMin,
    required double tdsMax,
   /*  int co2,
     int co2Min,
     int co2Max,
     int waterFlow,
     int waterFlowMin,
     int waterFlowMax,*/

  }) = _SensorModel;

  factory SensorModel.fromJson(Map<String, dynamic> json) =>
      _$SensorModelFromJson(json);
}
