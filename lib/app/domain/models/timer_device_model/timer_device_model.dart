import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_device_model.freezed.dart';
part 'timer_device_model.g.dart';

/// Stan bieżący urządzenia z telemetrii `001/state/devices` (Faza 4: niesie już
/// TYLKO state+speed; konfiguracja timerów jest pobierana osobno przez
/// `get_timers` → [DeviceTimersModel]).
@freezed
class TimerDeviceModel with _$TimerDeviceModel {
  const factory TimerDeviceModel({
    @Default(0) int speed,
    @Default(false) bool state,
  }) = _TimerDeviceModel;

  factory TimerDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$TimerDeviceModelFromJson(json);
}

@freezed
class Timer with _$Timer {
  const factory Timer({
    @Default(127) int week,
    @Default(Time()) Time on,
    @Default(Time()) Time off,
  }) = _Timer;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}

@freezed
class Time with _$Time {
  const factory Time({
    @Default(0) int h,
    @Default(0) int m,
    @Default(0) int s,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}
