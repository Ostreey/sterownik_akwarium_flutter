import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';



part 'devices_model.freezed.dart';
part 'devices_model.g.dart';

@freezed
class DevicesModel with _$DevicesModel {
  const factory DevicesModel({
    @Default(TimerDeviceModel()) TimerDeviceModel pompa1,
    @Default(TimerDeviceModel()) TimerDeviceModel pompa2,
    @Default(TimerDeviceModel()) TimerDeviceModel circulation1,
    @Default(TimerDeviceModel()) TimerDeviceModel circulation2,
    @Default(TimerDeviceModel()) TimerDeviceModel led,
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