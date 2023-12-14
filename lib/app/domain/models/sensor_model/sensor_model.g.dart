// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SensorModelImpl _$$SensorModelImplFromJson(Map<String, dynamic> json) =>
    _$SensorModelImpl(
      waterTemp: (json['waterTemp'] as num?)?.toDouble() ?? 0.0,
      waterTempMin: (json['waterTempMin'] as num?)?.toDouble() ?? 0.0,
      waterTempMax: (json['waterTempMax'] as num?)?.toDouble() ?? 0.0,
      airTemp: (json['airTemp'] as num?)?.toDouble() ?? 0.0,
      airTempMin: (json['airTempMin'] as num?)?.toDouble() ?? 0.0,
      airTempMax: (json['airTempMax'] as num?)?.toDouble() ?? 0.0,
      ph: (json['ph'] as num?)?.toDouble() ?? 0.0,
      phMin: (json['phMin'] as num?)?.toDouble() ?? 0.0,
      phMax: (json['phMax'] as num?)?.toDouble() ?? 0.0,
      tds: (json['tds'] as num?)?.toDouble() ?? 0.0,
      tdsMin: (json['tdsMin'] as num?)?.toDouble() ?? 0.0,
      tdsMax: (json['tdsMax'] as num?)?.toDouble() ?? 0.0,
      co2: (json['co2'] as num?)?.toDouble() ?? 0.0,
      co2Min: (json['co2Min'] as num?)?.toDouble() ?? 0.0,
      co2Max: (json['co2Max'] as num?)?.toDouble() ?? 0.0,
      waterFlow: (json['waterFlow'] as num?)?.toDouble() ?? 0.0,
      waterFlowMin: (json['waterFlowMin'] as num?)?.toDouble() ?? 0.0,
      waterFlowMax: (json['waterFlowMax'] as num?)?.toDouble() ?? 0.0,
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
      'co2': instance.co2,
      'co2Min': instance.co2Min,
      'co2Max': instance.co2Max,
      'waterFlow': instance.waterFlow,
      'waterFlowMin': instance.waterFlowMin,
      'waterFlowMax': instance.waterFlowMax,
      'pompa1': instance.pompa1,
      'pompa2': instance.pompa2,
      'circulation1': instance.circulation1,
      'circulation2': instance.circulation2,
    };
