// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutputStatusModelImpl _$$OutputStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OutputStatusModelImpl(
      state: json['state'] as bool? ?? false,
      alarmHigh: json['alarmHigh'] as bool? ?? false,
      alarmLow: json['alarmLow'] as bool? ?? false,
      manual: json['manual'] as bool? ?? false,
      blocked: json['blocked'] as bool? ?? false,
    );

Map<String, dynamic> _$$OutputStatusModelImplToJson(
        _$OutputStatusModelImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'alarmHigh': instance.alarmHigh,
      'alarmLow': instance.alarmLow,
      'manual': instance.manual,
      'blocked': instance.blocked,
    };
