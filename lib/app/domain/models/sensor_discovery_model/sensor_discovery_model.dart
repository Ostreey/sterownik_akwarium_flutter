import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_discovery_model.freezed.dart';
part 'sensor_discovery_model.g.dart';

@freezed
class SensorDiscoveryModel with _$SensorDiscoveryModel {
  const factory SensorDiscoveryModel({
    @Default([]) List<String> sensors,
  }) = _SensorDiscoveryModel;

  factory SensorDiscoveryModel.fromJson(Map<String, dynamic> json) =>
      _$SensorDiscoveryModelFromJson(json);
}
