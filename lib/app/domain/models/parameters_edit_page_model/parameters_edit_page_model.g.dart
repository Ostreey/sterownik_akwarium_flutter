// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters_edit_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParametersEditPageModelImpl _$$ParametersEditPageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParametersEditPageModelImpl(
      appBarTitle: json['appBarTitle'] as String,
      endpoint: json['endpoint'] as String,
      minValue: (json['minValue'] as num).toDouble(),
      maxValue: (json['maxValue'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      unit: json['unit'] as String,
      frequency: json['frequency'] as int? ?? -1,
    );

Map<String, dynamic> _$$ParametersEditPageModelImplToJson(
        _$ParametersEditPageModelImpl instance) =>
    <String, dynamic>{
      'appBarTitle': instance.appBarTitle,
      'endpoint': instance.endpoint,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'currentValue': instance.currentValue,
      'unit': instance.unit,
      'frequency': instance.frequency,
    };
