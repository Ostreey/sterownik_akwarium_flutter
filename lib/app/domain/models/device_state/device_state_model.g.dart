// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceStateModelImpl _$$DeviceStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceStateModelImpl(
      state: json['state'] as bool? ?? false,
      speed: json['speed'] as int? ?? 0,
    );

Map<String, dynamic> _$$DeviceStateModelImplToJson(
        _$DeviceStateModelImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'speed': instance.speed,
    };
