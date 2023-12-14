// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SensorModel _$SensorModelFromJson(Map<String, dynamic> json) {
  return _SensorModel.fromJson(json);
}

/// @nodoc
mixin _$SensorModel {
  double get waterTemp => throw _privateConstructorUsedError;
  double get waterTempMin => throw _privateConstructorUsedError;
  double get waterTempMax => throw _privateConstructorUsedError;
  double get airTemp => throw _privateConstructorUsedError;
  double get airTempMin => throw _privateConstructorUsedError;
  double get airTempMax => throw _privateConstructorUsedError;
  double get ph => throw _privateConstructorUsedError;
  double get phMin => throw _privateConstructorUsedError;
  double get phMax => throw _privateConstructorUsedError;
  double get tds => throw _privateConstructorUsedError;
  double get tdsMin => throw _privateConstructorUsedError;
  double get tdsMax => throw _privateConstructorUsedError;
  double get co2 => throw _privateConstructorUsedError;
  double get co2Min => throw _privateConstructorUsedError;
  double get co2Max => throw _privateConstructorUsedError;
  double get waterFlow => throw _privateConstructorUsedError;
  double get waterFlowMin => throw _privateConstructorUsedError;
  double get waterFlowMax => throw _privateConstructorUsedError;
  DeviceStateModel get pompa1 => throw _privateConstructorUsedError;
  DeviceStateModel get pompa2 => throw _privateConstructorUsedError;
  DeviceStateModel get circulation1 => throw _privateConstructorUsedError;
  DeviceStateModel get circulation2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SensorModelCopyWith<SensorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorModelCopyWith<$Res> {
  factory $SensorModelCopyWith(
          SensorModel value, $Res Function(SensorModel) then) =
      _$SensorModelCopyWithImpl<$Res, SensorModel>;
  @useResult
  $Res call(
      {double waterTemp,
      double waterTempMin,
      double waterTempMax,
      double airTemp,
      double airTempMin,
      double airTempMax,
      double ph,
      double phMin,
      double phMax,
      double tds,
      double tdsMin,
      double tdsMax,
      double co2,
      double co2Min,
      double co2Max,
      double waterFlow,
      double waterFlowMin,
      double waterFlowMax,
      DeviceStateModel pompa1,
      DeviceStateModel pompa2,
      DeviceStateModel circulation1,
      DeviceStateModel circulation2});

  $DeviceStateModelCopyWith<$Res> get pompa1;
  $DeviceStateModelCopyWith<$Res> get pompa2;
  $DeviceStateModelCopyWith<$Res> get circulation1;
  $DeviceStateModelCopyWith<$Res> get circulation2;
}

/// @nodoc
class _$SensorModelCopyWithImpl<$Res, $Val extends SensorModel>
    implements $SensorModelCopyWith<$Res> {
  _$SensorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waterTemp = null,
    Object? waterTempMin = null,
    Object? waterTempMax = null,
    Object? airTemp = null,
    Object? airTempMin = null,
    Object? airTempMax = null,
    Object? ph = null,
    Object? phMin = null,
    Object? phMax = null,
    Object? tds = null,
    Object? tdsMin = null,
    Object? tdsMax = null,
    Object? co2 = null,
    Object? co2Min = null,
    Object? co2Max = null,
    Object? waterFlow = null,
    Object? waterFlowMin = null,
    Object? waterFlowMax = null,
    Object? pompa1 = null,
    Object? pompa2 = null,
    Object? circulation1 = null,
    Object? circulation2 = null,
  }) {
    return _then(_value.copyWith(
      waterTemp: null == waterTemp
          ? _value.waterTemp
          : waterTemp // ignore: cast_nullable_to_non_nullable
              as double,
      waterTempMin: null == waterTempMin
          ? _value.waterTempMin
          : waterTempMin // ignore: cast_nullable_to_non_nullable
              as double,
      waterTempMax: null == waterTempMax
          ? _value.waterTempMax
          : waterTempMax // ignore: cast_nullable_to_non_nullable
              as double,
      airTemp: null == airTemp
          ? _value.airTemp
          : airTemp // ignore: cast_nullable_to_non_nullable
              as double,
      airTempMin: null == airTempMin
          ? _value.airTempMin
          : airTempMin // ignore: cast_nullable_to_non_nullable
              as double,
      airTempMax: null == airTempMax
          ? _value.airTempMax
          : airTempMax // ignore: cast_nullable_to_non_nullable
              as double,
      ph: null == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as double,
      phMin: null == phMin
          ? _value.phMin
          : phMin // ignore: cast_nullable_to_non_nullable
              as double,
      phMax: null == phMax
          ? _value.phMax
          : phMax // ignore: cast_nullable_to_non_nullable
              as double,
      tds: null == tds
          ? _value.tds
          : tds // ignore: cast_nullable_to_non_nullable
              as double,
      tdsMin: null == tdsMin
          ? _value.tdsMin
          : tdsMin // ignore: cast_nullable_to_non_nullable
              as double,
      tdsMax: null == tdsMax
          ? _value.tdsMax
          : tdsMax // ignore: cast_nullable_to_non_nullable
              as double,
      co2: null == co2
          ? _value.co2
          : co2 // ignore: cast_nullable_to_non_nullable
              as double,
      co2Min: null == co2Min
          ? _value.co2Min
          : co2Min // ignore: cast_nullable_to_non_nullable
              as double,
      co2Max: null == co2Max
          ? _value.co2Max
          : co2Max // ignore: cast_nullable_to_non_nullable
              as double,
      waterFlow: null == waterFlow
          ? _value.waterFlow
          : waterFlow // ignore: cast_nullable_to_non_nullable
              as double,
      waterFlowMin: null == waterFlowMin
          ? _value.waterFlowMin
          : waterFlowMin // ignore: cast_nullable_to_non_nullable
              as double,
      waterFlowMax: null == waterFlowMax
          ? _value.waterFlowMax
          : waterFlowMax // ignore: cast_nullable_to_non_nullable
              as double,
      pompa1: null == pompa1
          ? _value.pompa1
          : pompa1 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
      pompa2: null == pompa2
          ? _value.pompa2
          : pompa2 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
      circulation1: null == circulation1
          ? _value.circulation1
          : circulation1 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
      circulation2: null == circulation2
          ? _value.circulation2
          : circulation2 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceStateModelCopyWith<$Res> get pompa1 {
    return $DeviceStateModelCopyWith<$Res>(_value.pompa1, (value) {
      return _then(_value.copyWith(pompa1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceStateModelCopyWith<$Res> get pompa2 {
    return $DeviceStateModelCopyWith<$Res>(_value.pompa2, (value) {
      return _then(_value.copyWith(pompa2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceStateModelCopyWith<$Res> get circulation1 {
    return $DeviceStateModelCopyWith<$Res>(_value.circulation1, (value) {
      return _then(_value.copyWith(circulation1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceStateModelCopyWith<$Res> get circulation2 {
    return $DeviceStateModelCopyWith<$Res>(_value.circulation2, (value) {
      return _then(_value.copyWith(circulation2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SensorModelImplCopyWith<$Res>
    implements $SensorModelCopyWith<$Res> {
  factory _$$SensorModelImplCopyWith(
          _$SensorModelImpl value, $Res Function(_$SensorModelImpl) then) =
      __$$SensorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double waterTemp,
      double waterTempMin,
      double waterTempMax,
      double airTemp,
      double airTempMin,
      double airTempMax,
      double ph,
      double phMin,
      double phMax,
      double tds,
      double tdsMin,
      double tdsMax,
      double co2,
      double co2Min,
      double co2Max,
      double waterFlow,
      double waterFlowMin,
      double waterFlowMax,
      DeviceStateModel pompa1,
      DeviceStateModel pompa2,
      DeviceStateModel circulation1,
      DeviceStateModel circulation2});

  @override
  $DeviceStateModelCopyWith<$Res> get pompa1;
  @override
  $DeviceStateModelCopyWith<$Res> get pompa2;
  @override
  $DeviceStateModelCopyWith<$Res> get circulation1;
  @override
  $DeviceStateModelCopyWith<$Res> get circulation2;
}

/// @nodoc
class __$$SensorModelImplCopyWithImpl<$Res>
    extends _$SensorModelCopyWithImpl<$Res, _$SensorModelImpl>
    implements _$$SensorModelImplCopyWith<$Res> {
  __$$SensorModelImplCopyWithImpl(
      _$SensorModelImpl _value, $Res Function(_$SensorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waterTemp = null,
    Object? waterTempMin = null,
    Object? waterTempMax = null,
    Object? airTemp = null,
    Object? airTempMin = null,
    Object? airTempMax = null,
    Object? ph = null,
    Object? phMin = null,
    Object? phMax = null,
    Object? tds = null,
    Object? tdsMin = null,
    Object? tdsMax = null,
    Object? co2 = null,
    Object? co2Min = null,
    Object? co2Max = null,
    Object? waterFlow = null,
    Object? waterFlowMin = null,
    Object? waterFlowMax = null,
    Object? pompa1 = null,
    Object? pompa2 = null,
    Object? circulation1 = null,
    Object? circulation2 = null,
  }) {
    return _then(_$SensorModelImpl(
      waterTemp: null == waterTemp
          ? _value.waterTemp
          : waterTemp // ignore: cast_nullable_to_non_nullable
              as double,
      waterTempMin: null == waterTempMin
          ? _value.waterTempMin
          : waterTempMin // ignore: cast_nullable_to_non_nullable
              as double,
      waterTempMax: null == waterTempMax
          ? _value.waterTempMax
          : waterTempMax // ignore: cast_nullable_to_non_nullable
              as double,
      airTemp: null == airTemp
          ? _value.airTemp
          : airTemp // ignore: cast_nullable_to_non_nullable
              as double,
      airTempMin: null == airTempMin
          ? _value.airTempMin
          : airTempMin // ignore: cast_nullable_to_non_nullable
              as double,
      airTempMax: null == airTempMax
          ? _value.airTempMax
          : airTempMax // ignore: cast_nullable_to_non_nullable
              as double,
      ph: null == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as double,
      phMin: null == phMin
          ? _value.phMin
          : phMin // ignore: cast_nullable_to_non_nullable
              as double,
      phMax: null == phMax
          ? _value.phMax
          : phMax // ignore: cast_nullable_to_non_nullable
              as double,
      tds: null == tds
          ? _value.tds
          : tds // ignore: cast_nullable_to_non_nullable
              as double,
      tdsMin: null == tdsMin
          ? _value.tdsMin
          : tdsMin // ignore: cast_nullable_to_non_nullable
              as double,
      tdsMax: null == tdsMax
          ? _value.tdsMax
          : tdsMax // ignore: cast_nullable_to_non_nullable
              as double,
      co2: null == co2
          ? _value.co2
          : co2 // ignore: cast_nullable_to_non_nullable
              as double,
      co2Min: null == co2Min
          ? _value.co2Min
          : co2Min // ignore: cast_nullable_to_non_nullable
              as double,
      co2Max: null == co2Max
          ? _value.co2Max
          : co2Max // ignore: cast_nullable_to_non_nullable
              as double,
      waterFlow: null == waterFlow
          ? _value.waterFlow
          : waterFlow // ignore: cast_nullable_to_non_nullable
              as double,
      waterFlowMin: null == waterFlowMin
          ? _value.waterFlowMin
          : waterFlowMin // ignore: cast_nullable_to_non_nullable
              as double,
      waterFlowMax: null == waterFlowMax
          ? _value.waterFlowMax
          : waterFlowMax // ignore: cast_nullable_to_non_nullable
              as double,
      pompa1: null == pompa1
          ? _value.pompa1
          : pompa1 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
      pompa2: null == pompa2
          ? _value.pompa2
          : pompa2 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
      circulation1: null == circulation1
          ? _value.circulation1
          : circulation1 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
      circulation2: null == circulation2
          ? _value.circulation2
          : circulation2 // ignore: cast_nullable_to_non_nullable
              as DeviceStateModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SensorModelImpl implements _SensorModel {
  const _$SensorModelImpl(
      {this.waterTemp = 0.0,
      this.waterTempMin = 0.0,
      this.waterTempMax = 0.0,
      this.airTemp = 0.0,
      this.airTempMin = 0.0,
      this.airTempMax = 0.0,
      this.ph = 0.0,
      this.phMin = 0.0,
      this.phMax = 0.0,
      this.tds = 0.0,
      this.tdsMin = 0.0,
      this.tdsMax = 0.0,
      this.co2 = 0.0,
      this.co2Min = 0.0,
      this.co2Max = 0.0,
      this.waterFlow = 0.0,
      this.waterFlowMin = 0.0,
      this.waterFlowMax = 0.0,
      this.pompa1 = const DeviceStateModel(),
      this.pompa2 = const DeviceStateModel(),
      this.circulation1 = const DeviceStateModel(),
      this.circulation2 = const DeviceStateModel()});

  factory _$SensorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SensorModelImplFromJson(json);

  @override
  @JsonKey()
  final double waterTemp;
  @override
  @JsonKey()
  final double waterTempMin;
  @override
  @JsonKey()
  final double waterTempMax;
  @override
  @JsonKey()
  final double airTemp;
  @override
  @JsonKey()
  final double airTempMin;
  @override
  @JsonKey()
  final double airTempMax;
  @override
  @JsonKey()
  final double ph;
  @override
  @JsonKey()
  final double phMin;
  @override
  @JsonKey()
  final double phMax;
  @override
  @JsonKey()
  final double tds;
  @override
  @JsonKey()
  final double tdsMin;
  @override
  @JsonKey()
  final double tdsMax;
  @override
  @JsonKey()
  final double co2;
  @override
  @JsonKey()
  final double co2Min;
  @override
  @JsonKey()
  final double co2Max;
  @override
  @JsonKey()
  final double waterFlow;
  @override
  @JsonKey()
  final double waterFlowMin;
  @override
  @JsonKey()
  final double waterFlowMax;
  @override
  @JsonKey()
  final DeviceStateModel pompa1;
  @override
  @JsonKey()
  final DeviceStateModel pompa2;
  @override
  @JsonKey()
  final DeviceStateModel circulation1;
  @override
  @JsonKey()
  final DeviceStateModel circulation2;

  @override
  String toString() {
    return 'SensorModel(waterTemp: $waterTemp, waterTempMin: $waterTempMin, waterTempMax: $waterTempMax, airTemp: $airTemp, airTempMin: $airTempMin, airTempMax: $airTempMax, ph: $ph, phMin: $phMin, phMax: $phMax, tds: $tds, tdsMin: $tdsMin, tdsMax: $tdsMax, co2: $co2, co2Min: $co2Min, co2Max: $co2Max, waterFlow: $waterFlow, waterFlowMin: $waterFlowMin, waterFlowMax: $waterFlowMax, pompa1: $pompa1, pompa2: $pompa2, circulation1: $circulation1, circulation2: $circulation2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorModelImpl &&
            (identical(other.waterTemp, waterTemp) ||
                other.waterTemp == waterTemp) &&
            (identical(other.waterTempMin, waterTempMin) ||
                other.waterTempMin == waterTempMin) &&
            (identical(other.waterTempMax, waterTempMax) ||
                other.waterTempMax == waterTempMax) &&
            (identical(other.airTemp, airTemp) || other.airTemp == airTemp) &&
            (identical(other.airTempMin, airTempMin) ||
                other.airTempMin == airTempMin) &&
            (identical(other.airTempMax, airTempMax) ||
                other.airTempMax == airTempMax) &&
            (identical(other.ph, ph) || other.ph == ph) &&
            (identical(other.phMin, phMin) || other.phMin == phMin) &&
            (identical(other.phMax, phMax) || other.phMax == phMax) &&
            (identical(other.tds, tds) || other.tds == tds) &&
            (identical(other.tdsMin, tdsMin) || other.tdsMin == tdsMin) &&
            (identical(other.tdsMax, tdsMax) || other.tdsMax == tdsMax) &&
            (identical(other.co2, co2) || other.co2 == co2) &&
            (identical(other.co2Min, co2Min) || other.co2Min == co2Min) &&
            (identical(other.co2Max, co2Max) || other.co2Max == co2Max) &&
            (identical(other.waterFlow, waterFlow) ||
                other.waterFlow == waterFlow) &&
            (identical(other.waterFlowMin, waterFlowMin) ||
                other.waterFlowMin == waterFlowMin) &&
            (identical(other.waterFlowMax, waterFlowMax) ||
                other.waterFlowMax == waterFlowMax) &&
            (identical(other.pompa1, pompa1) || other.pompa1 == pompa1) &&
            (identical(other.pompa2, pompa2) || other.pompa2 == pompa2) &&
            (identical(other.circulation1, circulation1) ||
                other.circulation1 == circulation1) &&
            (identical(other.circulation2, circulation2) ||
                other.circulation2 == circulation2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        waterTemp,
        waterTempMin,
        waterTempMax,
        airTemp,
        airTempMin,
        airTempMax,
        ph,
        phMin,
        phMax,
        tds,
        tdsMin,
        tdsMax,
        co2,
        co2Min,
        co2Max,
        waterFlow,
        waterFlowMin,
        waterFlowMax,
        pompa1,
        pompa2,
        circulation1,
        circulation2
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorModelImplCopyWith<_$SensorModelImpl> get copyWith =>
      __$$SensorModelImplCopyWithImpl<_$SensorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SensorModelImplToJson(
      this,
    );
  }
}

abstract class _SensorModel implements SensorModel {
  const factory _SensorModel(
      {final double waterTemp,
      final double waterTempMin,
      final double waterTempMax,
      final double airTemp,
      final double airTempMin,
      final double airTempMax,
      final double ph,
      final double phMin,
      final double phMax,
      final double tds,
      final double tdsMin,
      final double tdsMax,
      final double co2,
      final double co2Min,
      final double co2Max,
      final double waterFlow,
      final double waterFlowMin,
      final double waterFlowMax,
      final DeviceStateModel pompa1,
      final DeviceStateModel pompa2,
      final DeviceStateModel circulation1,
      final DeviceStateModel circulation2}) = _$SensorModelImpl;

  factory _SensorModel.fromJson(Map<String, dynamic> json) =
      _$SensorModelImpl.fromJson;

  @override
  double get waterTemp;
  @override
  double get waterTempMin;
  @override
  double get waterTempMax;
  @override
  double get airTemp;
  @override
  double get airTempMin;
  @override
  double get airTempMax;
  @override
  double get ph;
  @override
  double get phMin;
  @override
  double get phMax;
  @override
  double get tds;
  @override
  double get tdsMin;
  @override
  double get tdsMax;
  @override
  double get co2;
  @override
  double get co2Min;
  @override
  double get co2Max;
  @override
  double get waterFlow;
  @override
  double get waterFlowMin;
  @override
  double get waterFlowMax;
  @override
  DeviceStateModel get pompa1;
  @override
  DeviceStateModel get pompa2;
  @override
  DeviceStateModel get circulation1;
  @override
  DeviceStateModel get circulation2;
  @override
  @JsonKey(ignore: true)
  _$$SensorModelImplCopyWith<_$SensorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
