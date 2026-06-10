import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_page_model.freezed.dart';
part 'timer_page_model.g.dart';

/// Argument nawigacji do ekranu timerów urządzenia (Faza 4).
///
/// [endpoint] to device-qualified `"<id>/<device>"` (np. `"001/pompa1"`), gdzie
/// `<device>` to nazwa rozpoznawana przez firmware (pompa1/circul1/soc1/led).
/// Konfiguracja timerów NIE jest już przekazywana z telemetrii — ekran pobiera ją
/// sam przez `requestTimers(endpoint)` (read-on-demand).
@freezed
class TimerPageModel with _$TimerPageModel {
  const factory TimerPageModel({
    required String appBarTitle,
    required String endpoint,
  }) = _TimerPageModel;

  factory TimerPageModel.fromJson(Map<String, dynamic> json) =>
      _$TimerPageModelFromJson(json);
}

