import 'package:freezed_annotation/freezed_annotation.dart';

import '../device_state/device_state_model.dart';

part 'devices_model.freezed.dart';
part 'devices_model.g.dart';

@freezed
class DevicesModel with _$DevicesModel {
  const factory DevicesModel({
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
  }) = _DevicesModel;

  factory DevicesModel.fromJson(Map<String, dynamic> json) =>
      _$DevicesModelFromJson(json);
}