// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_timers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceTimersModelImpl _$$DeviceTimersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceTimersModelImpl(
      device: json['device'] as String? ?? '',
      pwm: json['pwm'] as bool? ?? false,
      timers: (json['timers'] as List<dynamic>?)
              ?.map((e) => TimerSlotModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TimerSlotModel>[],
    );

Map<String, dynamic> _$$DeviceTimersModelImplToJson(
        _$DeviceTimersModelImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
      'pwm': instance.pwm,
      'timers': instance.timers,
    };
