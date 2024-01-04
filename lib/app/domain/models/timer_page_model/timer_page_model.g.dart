// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerPageModelImpl _$$TimerPageModelImplFromJson(Map<String, dynamic> json) =>
    _$TimerPageModelImpl(
      appBarTitle: json['appBarTitle'] as String,
      endpoint: json['endpoint'] as String,
      timerDeviceModel: TimerDeviceModel.fromJson(
          json['timerDeviceModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TimerPageModelImplToJson(
        _$TimerPageModelImpl instance) =>
    <String, dynamic>{
      'appBarTitle': instance.appBarTitle,
      'endpoint': instance.endpoint,
      'timerDeviceModel': instance.timerDeviceModel,
    };
