// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerSlotModelImpl _$$TimerSlotModelImplFromJson(Map<String, dynamic> json) =>
    _$TimerSlotModelImpl(
      i: (json['i'] as num?)?.toInt() ?? 0,
      repeat: (json['repeat'] as num?)?.toInt() ?? 0,
      week: (json['week'] as num?)?.toInt() ?? 127,
      on: json['on'] == null
          ? const Time()
          : Time.fromJson(json['on'] as Map<String, dynamic>),
      off: json['off'] == null
          ? const Time()
          : Time.fromJson(json['off'] as Map<String, dynamic>),
      speed: (json['speed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TimerSlotModelImplToJson(
        _$TimerSlotModelImpl instance) =>
    <String, dynamic>{
      'i': instance.i,
      'repeat': instance.repeat,
      'week': instance.week,
      'on': instance.on,
      'off': instance.off,
      'speed': instance.speed,
    };
