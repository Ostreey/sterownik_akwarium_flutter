import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';

part 'timer_slot_model.freezed.dart';
part 'timer_slot_model.g.dart';

/// Pojedynczy slot timera urządzenia (Faza 4: read-on-demand).
///
/// Pobierany przez `get_timers` (firmware odsyła 6 slotów na `001/timers/<device>`),
/// zapisywany przez `set_timer`. Pole [repeat] = firmware `repetetiveWeek`:
/// 0 = slot wyłączony, 1 = co tydzień, 2 = co 2 tygodnie, 3 = co 3, 4 = co 4.
/// [speed] (duty PWM 0–100) istotne tylko dla urządzeń PWM (pompy/cyrkulacja).
@freezed
class TimerSlotModel with _$TimerSlotModel {
  const factory TimerSlotModel({
    @Default(0) int i,
    @Default(0) int repeat,
    @Default(127) int week,
    @Default(Time()) Time on,
    @Default(Time()) Time off,
    @Default(0) int speed,
  }) = _TimerSlotModel;

  factory TimerSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimerSlotModelFromJson(json);
}
