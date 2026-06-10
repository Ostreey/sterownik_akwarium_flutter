// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerDeviceModelImpl _$$TimerDeviceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TimerDeviceModelImpl(
      speed: (json['speed'] as num?)?.toInt() ?? 0,
      state: json['state'] as bool? ?? false,
    );

Map<String, dynamic> _$$TimerDeviceModelImplToJson(
        _$TimerDeviceModelImpl instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'state': instance.state,
    };

_$TimerImpl _$$TimerImplFromJson(Map<String, dynamic> json) => _$TimerImpl(
      week: (json['week'] as num?)?.toInt() ?? 127,
      on: json['on'] == null
          ? const Time()
          : Time.fromJson(json['on'] as Map<String, dynamic>),
      off: json['off'] == null
          ? const Time()
          : Time.fromJson(json['off'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TimerImplToJson(_$TimerImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'on': instance.on,
      'off': instance.off,
    };

_$TimeImpl _$$TimeImplFromJson(Map<String, dynamic> json) => _$TimeImpl(
      h: (json['h'] as num?)?.toInt() ?? 0,
      m: (json['m'] as num?)?.toInt() ?? 0,
      s: (json['s'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TimeImplToJson(_$TimeImpl instance) =>
    <String, dynamic>{
      'h': instance.h,
      'm': instance.m,
      's': instance.s,
    };
