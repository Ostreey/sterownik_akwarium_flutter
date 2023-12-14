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
  }) = _DevicesModel;

  factory DevicesModel.fromJson(Map<String, dynamic> json) =>
      _$DevicesModelFromJson(json);
}