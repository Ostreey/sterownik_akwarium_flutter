import 'package:freezed_annotation/freezed_annotation.dart';

part 'output_status_model.freezed.dart';
part 'output_status_model.g.dart';

/// Status urządzenia regulowanego (grzałka/wentylator) z grupy telemetrii
/// `001/state/system` (Faza 4). `state` = histeresisState (on/off regulacji).
@freezed
class OutputStatusModel with _$OutputStatusModel {
  const factory OutputStatusModel({
    @Default(false) bool state,
    @Default(false) bool alarmHigh,
    @Default(false) bool alarmLow,
    @Default(false) bool manual,
    @Default(false) bool blocked,
  }) = _OutputStatusModel;

  factory OutputStatusModel.fromJson(Map<String, dynamic> json) =>
      _$OutputStatusModelFromJson(json);
}
