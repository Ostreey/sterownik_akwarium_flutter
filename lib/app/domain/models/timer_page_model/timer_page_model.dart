import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';


part 'timer_page_model.freezed.dart';
part 'timer_page_model.g.dart';


@freezed
class TimerPageModel with _$TimerPageModel {
  const factory TimerPageModel({
    required String appBarTitle,
    required String endpoint,
    required TimerDeviceModel timerDeviceModel,

  }) = _TimerPageModel;

  factory TimerPageModel.fromJson(Map<String, dynamic> json) =>
      _$TimerPageModelFromJson(json);
}

