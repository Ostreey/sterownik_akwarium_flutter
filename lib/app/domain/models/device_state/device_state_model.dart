import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_state_model.freezed.dart';
part 'device_state_model.g.dart';

@freezed
class DeviceStateModel with _$DeviceStateModel {
  const factory DeviceStateModel({
    @Default(false) bool state,
    @Default(0) int speed,
    @Default("") String timerOn,
    @Default("") String timerOff,
  }) = _DeviceStateModel;

  factory DeviceStateModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceStateModelFromJson(json);
}
