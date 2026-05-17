// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_discovery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SensorDiscoveryModelImpl _$$SensorDiscoveryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SensorDiscoveryModelImpl(
      sensors: (json['sensors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SensorDiscoveryModelImplToJson(
        _$SensorDiscoveryModelImpl instance) =>
    <String, dynamic>{
      'sensors': instance.sensors,
    };
