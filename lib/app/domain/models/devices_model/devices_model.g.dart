// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevicesModelImpl _$$DevicesModelImplFromJson(Map<String, dynamic> json) =>
    _$DevicesModelImpl(
      pompa1: json['pompa1'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa1'] as Map<String, dynamic>),
      pompa2: json['pompa2'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa2'] as Map<String, dynamic>),
      pompa3: json['pompa3'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa3'] as Map<String, dynamic>),
      pompa4: json['pompa4'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa4'] as Map<String, dynamic>),
      pompa5: json['pompa5'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa5'] as Map<String, dynamic>),
      pompa6: json['pompa6'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa6'] as Map<String, dynamic>),
      pompa7: json['pompa7'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa7'] as Map<String, dynamic>),
      circulation1: json['circulation1'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(
              json['circulation1'] as Map<String, dynamic>),
      circulation2: json['circulation2'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(
              json['circulation2'] as Map<String, dynamic>),
      led: json['led'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['led'] as Map<String, dynamic>),
      socket1: json['socket1'] as bool? ?? false,
      socket2: json['socket2'] as bool? ?? false,
      socket3: json['socket3'] as bool? ?? false,
      socket4: json['socket4'] as bool? ?? false,
      socket5: json['socket5'] as bool? ?? false,
      socket6: json['socket6'] as bool? ?? false,
      socket7: json['socket7'] as bool? ?? false,
    );

Map<String, dynamic> _$$DevicesModelImplToJson(_$DevicesModelImpl instance) =>
    <String, dynamic>{
      'pompa1': instance.pompa1,
      'pompa2': instance.pompa2,
      'pompa3': instance.pompa3,
      'pompa4': instance.pompa4,
      'pompa5': instance.pompa5,
      'pompa6': instance.pompa6,
      'pompa7': instance.pompa7,
      'circulation1': instance.circulation1,
      'circulation2': instance.circulation2,
      'led': instance.led,
      'socket1': instance.socket1,
      'socket2': instance.socket2,
      'socket3': instance.socket3,
      'socket4': instance.socket4,
      'socket5': instance.socket5,
      'socket6': instance.socket6,
      'socket7': instance.socket7,
    };
