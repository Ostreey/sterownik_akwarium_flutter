// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SensorModelImpl _$$SensorModelImplFromJson(Map<String, dynamic> json) =>
    _$SensorModelImpl(
      waterTemp: (json['waterTemp'] as num).toDouble(),
      waterTempMin: (json['waterTempMin'] as num).toDouble(),
      waterTempMax: (json['waterTempMax'] as num).toDouble(),
      airTemp: (json['airTemp'] as num).toDouble(),
      airTempMin: (json['airTempMin'] as num).toDouble(),
      airTempMax: (json['airTempMax'] as num).toDouble(),
      ph: (json['ph'] as num).toDouble(),
      phMin: (json['phMin'] as num).toDouble(),
      phMax: (json['phMax'] as num).toDouble(),
      tds: (json['tds'] as num).toDouble(),
      tdsMin: (json['tdsMin'] as num).toDouble(),
      tdsMax: (json['tdsMax'] as num).toDouble(),
    );

Map<String, dynamic> _$$SensorModelImplToJson(_$SensorModelImpl instance) =>
    <String, dynamic>{
      'waterTemp': instance.waterTemp,
      'waterTempMin': instance.waterTempMin,
      'waterTempMax': instance.waterTempMax,
      'airTemp': instance.airTemp,
      'airTempMin': instance.airTempMin,
      'airTempMax': instance.airTempMax,
      'ph': instance.ph,
      'phMin': instance.phMin,
      'phMax': instance.phMax,
      'tds': instance.tds,
      'tdsMin': instance.tdsMin,
      'tdsMax': instance.tdsMax,
    };
