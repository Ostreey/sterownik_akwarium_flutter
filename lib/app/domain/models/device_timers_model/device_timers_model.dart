import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_slot_model/timer_slot_model.dart';

part 'device_timers_model.freezed.dart';
part 'device_timers_model.g.dart';

/// Pełna konfiguracja timerów jednego urządzenia (odpowiedź firmware na
/// `get_timers`, topik `001/timers/<device>`). [pwm] mówi, czy urządzenie
/// obsługuje prędkość per timer (pompy/cyrkulacja) — UI pokazuje wtedy suwak.
@freezed
class DeviceTimersModel with _$DeviceTimersModel {
  const factory DeviceTimersModel({
    @Default('') String device,
    @Default(false) bool pwm,
    @Default(<TimerSlotModel>[]) List<TimerSlotModel> timers,
  }) = _DeviceTimersModel;

  factory DeviceTimersModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceTimersModelFromJson(json);
}
