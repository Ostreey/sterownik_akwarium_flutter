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
      airTempFreq: json['airTempFreq'] as int? ?? 0,
      ph: (json['ph'] as num?)?.toDouble() ?? 0.0,
      phSet: (json['phSet'] as num?)?.toDouble() ?? 0.0,
      phHisteresis: (json['phHisteresis'] as num?)?.toDouble() ?? 0.0,
      tds: (json['tds'] as num?)?.toDouble() ?? 0.0,
      tdsSet: (json['tdsSet'] as num?)?.toDouble() ?? 0.0,
      tdsHisteresis: (json['tdsHisteresis'] as num?)?.toDouble() ?? 0.0,
      co2: (json['co2'] as num?)?.toDouble() ?? 0.0,
      co2Min: (json['co2Min'] as num?)?.toDouble() ?? 0.0,
      co2Max: (json['co2Max'] as num?)?.toDouble() ?? 0.0,
      waterFlow: (json['waterFlow'] as num?)?.toDouble() ?? 0.0,
      waterFlowMin: (json['waterFlowMin'] as num?)?.toDouble() ?? 0.0,
      waterFlowMax: (json['waterFlowMax'] as num?)?.toDouble() ?? 0.0,
      pompa1: json['pompa1'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa1'] as Map<String, dynamic>),
      pompa2: json['pompa2'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['pompa2'] as Map<String, dynamic>),
      circul1: json['circul1'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['circul1'] as Map<String, dynamic>),
      circul2: json['circul2'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['circul2'] as Map<String, dynamic>),
      led: json['led'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['led'] as Map<String, dynamic>),
      soc1: json['soc1'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['soc1'] as Map<String, dynamic>),
      soc2: json['soc2'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['soc2'] as Map<String, dynamic>),
      soc3: json['soc3'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['soc3'] as Map<String, dynamic>),
      soc4: json['soc4'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['soc4'] as Map<String, dynamic>),
      soc5: json['soc5'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['soc5'] as Map<String, dynamic>),
      soc6: json['soc6'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['soc6'] as Map<String, dynamic>),
      soc7: json['soc7'] == null
          ? const TimerDeviceModel()
          : TimerDeviceModel.fromJson(json['soc7'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SensorModelImplToJson(_$SensorModelImpl instance) =>
    <String, dynamic>{
      'waterTemp': instance.waterTemp,
      'waterTempMin': instance.waterTempMin,
      'waterTempMax': instance.waterTempMax,
      'airTemp': instance.airTemp,
      'airTempMin': instance.airTempMin,
      'airTempMax': instance.airTempMax,
      'airTempFreq': instance.airTempFreq,
      'ph': instance.ph,
      'phSet': instance.phSet,
      'phHisteresis': instance.phHisteresis,
      'tds': instance.tds,
      'tdsSet': instance.tdsSet,
      'tdsHisteresis': instance.tdsHisteresis,
      'co2': instance.co2,
      'co2Min': instance.co2Min,
      'co2Max': instance.co2Max,
      'waterFlow': instance.waterFlow,
      'waterFlowMin': instance.waterFlowMin,
      'waterFlowMax': instance.waterFlowMax,
      'pompa1': instance.pompa1,
      'pompa2': instance.pompa2,
      'circul1': instance.circul1,
      'circul2': instance.circul2,
      'led': instance.led,
      'soc1': instance.soc1,
      'soc2': instance.soc2,
      'soc3': instance.soc3,
      'soc4': instance.soc4,
      'soc5': instance.soc5,
      'soc6': instance.soc6,
      'soc7': instance.soc7,
    };
