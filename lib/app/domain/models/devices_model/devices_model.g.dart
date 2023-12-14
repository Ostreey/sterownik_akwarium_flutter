// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevicesModelImpl _$$DevicesModelImplFromJson(Map<String, dynamic> json) =>
    _$DevicesModelImpl(
      pompa1: json['pompa1'] == null
          ? const DeviceStateModel()
          : DeviceStateModel.fromJson(json['pompa1'] as Map<String, dynamic>),
      pompa2: json['pompa2'] == null
          ? const DeviceStateModel()
          : DeviceStateModel.fromJson(json['pompa2'] as Map<String, dynamic>),
      circulation1: json['circulation1'] == null
          ? const DeviceStateModel()
          : DeviceStateModel.fromJson(
              json['circulation1'] as Map<String, dynamic>),
      circulation2: json['circulation2'] == null
          ? const DeviceStateModel()
          : DeviceStateModel.fromJson(
              json['circulation2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DevicesModelImplToJson(_$DevicesModelImpl instance) =>
    <String, dynamic>{
      'pompa1': instance.pompa1,
      'pompa2': instance.pompa2,
      'circulation1': instance.circulation1,
      'circulation2': instance.circulation2,
    };
