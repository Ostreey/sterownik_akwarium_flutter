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
  int get airTempFreq => throw _privateConstructorUsedError;
  double get ph => throw _privateConstructorUsedError;
  double get phSet => throw _privateConstructorUsedError;
  double get phHisteresis => throw _privateConstructorUsedError;
  double get tds => throw _privateConstructorUsedError;
  double get tdsSet => throw _privateConstructorUsedError;
  double get tdsHisteresis => throw _privateConstructorUsedError;
  double get co2 => throw _privateConstructorUsedError;
  double get co2Min => throw _privateConstructorUsedError;
  double get co2Max => throw _privateConstructorUsedError;
  double get waterFlow => throw _privateConstructorUsedError;
  double get waterFlowMin => throw _privateConstructorUsedError;
  double get waterFlowMax => throw _privateConstructorUsedError;
  TimerDeviceModel get pompa1 => throw _privateConstructorUsedError;
  TimerDeviceModel get pompa2 => throw _privateConstructorUsedError;
  TimerDeviceModel get circulation1 => throw _privateConstructorUsedError;
  TimerDeviceModel get circulation2 => throw _privateConstructorUsedError;
  TimerDeviceModel get led => throw _privateConstructorUsedError;
  TimerDeviceModel get soc1 => throw _privateConstructorUsedError;
  TimerDeviceModel get soc2 => throw _privateConstructorUsedError;
  TimerDeviceModel get soc3 => throw _privateConstructorUsedError;
  TimerDeviceModel get soc4 => throw _privateConstructorUsedError;
  TimerDeviceModel get soc5 => throw _privateConstructorUsedError;
  TimerDeviceModel get soc6 => throw _privateConstructorUsedError;
  TimerDeviceModel get soc7 => throw _privateConstructorUsedError;

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
      int airTempFreq,
      double ph,
      double phSet,
      double phHisteresis,
      double tds,
      double tdsSet,
      double tdsHisteresis,
      double co2,
      double co2Min,
      double co2Max,
      double waterFlow,
      double waterFlowMin,
      double waterFlowMax,
      TimerDeviceModel pompa1,
      TimerDeviceModel pompa2,
      TimerDeviceModel circulation1,
      TimerDeviceModel circulation2,
      TimerDeviceModel led,
      TimerDeviceModel soc1,
      TimerDeviceModel soc2,
      TimerDeviceModel soc3,
      TimerDeviceModel soc4,
      TimerDeviceModel soc5,
      TimerDeviceModel soc6,
      TimerDeviceModel soc7});

  $TimerDeviceModelCopyWith<$Res> get pompa1;
  $TimerDeviceModelCopyWith<$Res> get pompa2;
  $TimerDeviceModelCopyWith<$Res> get circulation1;
  $TimerDeviceModelCopyWith<$Res> get circulation2;
  $TimerDeviceModelCopyWith<$Res> get led;
  $TimerDeviceModelCopyWith<$Res> get soc1;
  $TimerDeviceModelCopyWith<$Res> get soc2;
  $TimerDeviceModelCopyWith<$Res> get soc3;
  $TimerDeviceModelCopyWith<$Res> get soc4;
  $TimerDeviceModelCopyWith<$Res> get soc5;
  $TimerDeviceModelCopyWith<$Res> get soc6;
  $TimerDeviceModelCopyWith<$Res> get soc7;
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
    Object? airTempFreq = null,
    Object? ph = null,
    Object? phSet = null,
    Object? phHisteresis = null,
    Object? tds = null,
    Object? tdsSet = null,
    Object? tdsHisteresis = null,
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
    Object? led = null,
    Object? soc1 = null,
    Object? soc2 = null,
    Object? soc3 = null,
    Object? soc4 = null,
    Object? soc5 = null,
    Object? soc6 = null,
    Object? soc7 = null,
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
      airTempFreq: null == airTempFreq
          ? _value.airTempFreq
          : airTempFreq // ignore: cast_nullable_to_non_nullable
              as int,
      ph: null == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as double,
      phSet: null == phSet
          ? _value.phSet
          : phSet // ignore: cast_nullable_to_non_nullable
              as double,
      phHisteresis: null == phHisteresis
          ? _value.phHisteresis
          : phHisteresis // ignore: cast_nullable_to_non_nullable
              as double,
      tds: null == tds
          ? _value.tds
          : tds // ignore: cast_nullable_to_non_nullable
              as double,
      tdsSet: null == tdsSet
          ? _value.tdsSet
          : tdsSet // ignore: cast_nullable_to_non_nullable
              as double,
      tdsHisteresis: null == tdsHisteresis
          ? _value.tdsHisteresis
          : tdsHisteresis // ignore: cast_nullable_to_non_nullable
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
              as TimerDeviceModel,
      pompa2: null == pompa2
          ? _value.pompa2
          : pompa2 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      circulation1: null == circulation1
          ? _value.circulation1
          : circulation1 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      circulation2: null == circulation2
          ? _value.circulation2
          : circulation2 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      led: null == led
          ? _value.led
          : led // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc1: null == soc1
          ? _value.soc1
          : soc1 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc2: null == soc2
          ? _value.soc2
          : soc2 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc3: null == soc3
          ? _value.soc3
          : soc3 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc4: null == soc4
          ? _value.soc4
          : soc4 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc5: null == soc5
          ? _value.soc5
          : soc5 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc6: null == soc6
          ? _value.soc6
          : soc6 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc7: null == soc7
          ? _value.soc7
          : soc7 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get pompa1 {
    return $TimerDeviceModelCopyWith<$Res>(_value.pompa1, (value) {
      return _then(_value.copyWith(pompa1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get pompa2 {
    return $TimerDeviceModelCopyWith<$Res>(_value.pompa2, (value) {
      return _then(_value.copyWith(pompa2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get circulation1 {
    return $TimerDeviceModelCopyWith<$Res>(_value.circulation1, (value) {
      return _then(_value.copyWith(circulation1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get circulation2 {
    return $TimerDeviceModelCopyWith<$Res>(_value.circulation2, (value) {
      return _then(_value.copyWith(circulation2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get led {
    return $TimerDeviceModelCopyWith<$Res>(_value.led, (value) {
      return _then(_value.copyWith(led: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get soc1 {
    return $TimerDeviceModelCopyWith<$Res>(_value.soc1, (value) {
      return _then(_value.copyWith(soc1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get soc2 {
    return $TimerDeviceModelCopyWith<$Res>(_value.soc2, (value) {
      return _then(_value.copyWith(soc2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get soc3 {
    return $TimerDeviceModelCopyWith<$Res>(_value.soc3, (value) {
      return _then(_value.copyWith(soc3: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get soc4 {
    return $TimerDeviceModelCopyWith<$Res>(_value.soc4, (value) {
      return _then(_value.copyWith(soc4: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get soc5 {
    return $TimerDeviceModelCopyWith<$Res>(_value.soc5, (value) {
      return _then(_value.copyWith(soc5: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get soc6 {
    return $TimerDeviceModelCopyWith<$Res>(_value.soc6, (value) {
      return _then(_value.copyWith(soc6: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get soc7 {
    return $TimerDeviceModelCopyWith<$Res>(_value.soc7, (value) {
      return _then(_value.copyWith(soc7: value) as $Val);
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
      int airTempFreq,
      double ph,
      double phSet,
      double phHisteresis,
      double tds,
      double tdsSet,
      double tdsHisteresis,
      double co2,
      double co2Min,
      double co2Max,
      double waterFlow,
      double waterFlowMin,
      double waterFlowMax,
      TimerDeviceModel pompa1,
      TimerDeviceModel pompa2,
      TimerDeviceModel circulation1,
      TimerDeviceModel circulation2,
      TimerDeviceModel led,
      TimerDeviceModel soc1,
      TimerDeviceModel soc2,
      TimerDeviceModel soc3,
      TimerDeviceModel soc4,
      TimerDeviceModel soc5,
      TimerDeviceModel soc6,
      TimerDeviceModel soc7});

  @override
  $TimerDeviceModelCopyWith<$Res> get pompa1;
  @override
  $TimerDeviceModelCopyWith<$Res> get pompa2;
  @override
  $TimerDeviceModelCopyWith<$Res> get circulation1;
  @override
  $TimerDeviceModelCopyWith<$Res> get circulation2;
  @override
  $TimerDeviceModelCopyWith<$Res> get led;
  @override
  $TimerDeviceModelCopyWith<$Res> get soc1;
  @override
  $TimerDeviceModelCopyWith<$Res> get soc2;
  @override
  $TimerDeviceModelCopyWith<$Res> get soc3;
  @override
  $TimerDeviceModelCopyWith<$Res> get soc4;
  @override
  $TimerDeviceModelCopyWith<$Res> get soc5;
  @override
  $TimerDeviceModelCopyWith<$Res> get soc6;
  @override
  $TimerDeviceModelCopyWith<$Res> get soc7;
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
    Object? airTempFreq = null,
    Object? ph = null,
    Object? phSet = null,
    Object? phHisteresis = null,
    Object? tds = null,
    Object? tdsSet = null,
    Object? tdsHisteresis = null,
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
    Object? led = null,
    Object? soc1 = null,
    Object? soc2 = null,
    Object? soc3 = null,
    Object? soc4 = null,
    Object? soc5 = null,
    Object? soc6 = null,
    Object? soc7 = null,
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
      airTempFreq: null == airTempFreq
          ? _value.airTempFreq
          : airTempFreq // ignore: cast_nullable_to_non_nullable
              as int,
      ph: null == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as double,
      phSet: null == phSet
          ? _value.phSet
          : phSet // ignore: cast_nullable_to_non_nullable
              as double,
      phHisteresis: null == phHisteresis
          ? _value.phHisteresis
          : phHisteresis // ignore: cast_nullable_to_non_nullable
              as double,
      tds: null == tds
          ? _value.tds
          : tds // ignore: cast_nullable_to_non_nullable
              as double,
      tdsSet: null == tdsSet
          ? _value.tdsSet
          : tdsSet // ignore: cast_nullable_to_non_nullable
              as double,
      tdsHisteresis: null == tdsHisteresis
          ? _value.tdsHisteresis
          : tdsHisteresis // ignore: cast_nullable_to_non_nullable
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
              as TimerDeviceModel,
      pompa2: null == pompa2
          ? _value.pompa2
          : pompa2 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      circulation1: null == circulation1
          ? _value.circulation1
          : circulation1 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      circulation2: null == circulation2
          ? _value.circulation2
          : circulation2 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      led: null == led
          ? _value.led
          : led // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc1: null == soc1
          ? _value.soc1
          : soc1 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc2: null == soc2
          ? _value.soc2
          : soc2 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc3: null == soc3
          ? _value.soc3
          : soc3 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc4: null == soc4
          ? _value.soc4
          : soc4 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc5: null == soc5
          ? _value.soc5
          : soc5 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc6: null == soc6
          ? _value.soc6
          : soc6 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
      soc7: null == soc7
          ? _value.soc7
          : soc7 // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
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
      this.airTempFreq = 0,
      this.ph = 0.0,
      this.phSet = 0.0,
      this.phHisteresis = 0.0,
      this.tds = 0.0,
      this.tdsSet = 0.0,
      this.tdsHisteresis = 0.0,
      this.co2 = 0.0,
      this.co2Min = 0.0,
      this.co2Max = 0.0,
      this.waterFlow = 0.0,
      this.waterFlowMin = 0.0,
      this.waterFlowMax = 0.0,
      this.pompa1 = const TimerDeviceModel(),
      this.pompa2 = const TimerDeviceModel(),
      this.circulation1 = const TimerDeviceModel(),
      this.circulation2 = const TimerDeviceModel(),
      this.led = const TimerDeviceModel(),
      this.soc1 = const TimerDeviceModel(),
      this.soc2 = const TimerDeviceModel(),
      this.soc3 = const TimerDeviceModel(),
      this.soc4 = const TimerDeviceModel(),
      this.soc5 = const TimerDeviceModel(),
      this.soc6 = const TimerDeviceModel(),
      this.soc7 = const TimerDeviceModel()});

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
  final int airTempFreq;
  @override
  @JsonKey()
  final double ph;
  @override
  @JsonKey()
  final double phSet;
  @override
  @JsonKey()
  final double phHisteresis;
  @override
  @JsonKey()
  final double tds;
  @override
  @JsonKey()
  final double tdsSet;
  @override
  @JsonKey()
  final double tdsHisteresis;
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
  final TimerDeviceModel pompa1;
  @override
  @JsonKey()
  final TimerDeviceModel pompa2;
  @override
  @JsonKey()
  final TimerDeviceModel circulation1;
  @override
  @JsonKey()
  final TimerDeviceModel circulation2;
  @override
  @JsonKey()
  final TimerDeviceModel led;
  @override
  @JsonKey()
  final TimerDeviceModel soc1;
  @override
  @JsonKey()
  final TimerDeviceModel soc2;
  @override
  @JsonKey()
  final TimerDeviceModel soc3;
  @override
  @JsonKey()
  final TimerDeviceModel soc4;
  @override
  @JsonKey()
  final TimerDeviceModel soc5;
  @override
  @JsonKey()
  final TimerDeviceModel soc6;
  @override
  @JsonKey()
  final TimerDeviceModel soc7;

  @override
  String toString() {
    return 'SensorModel(waterTemp: $waterTemp, waterTempMin: $waterTempMin, waterTempMax: $waterTempMax, airTemp: $airTemp, airTempMin: $airTempMin, airTempMax: $airTempMax, airTempFreq: $airTempFreq, ph: $ph, phSet: $phSet, phHisteresis: $phHisteresis, tds: $tds, tdsSet: $tdsSet, tdsHisteresis: $tdsHisteresis, co2: $co2, co2Min: $co2Min, co2Max: $co2Max, waterFlow: $waterFlow, waterFlowMin: $waterFlowMin, waterFlowMax: $waterFlowMax, pompa1: $pompa1, pompa2: $pompa2, circulation1: $circulation1, circulation2: $circulation2, led: $led, soc1: $soc1, soc2: $soc2, soc3: $soc3, soc4: $soc4, soc5: $soc5, soc6: $soc6, soc7: $soc7)';
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
            (identical(other.airTempFreq, airTempFreq) ||
                other.airTempFreq == airTempFreq) &&
            (identical(other.ph, ph) || other.ph == ph) &&
            (identical(other.phSet, phSet) || other.phSet == phSet) &&
            (identical(other.phHisteresis, phHisteresis) ||
                other.phHisteresis == phHisteresis) &&
            (identical(other.tds, tds) || other.tds == tds) &&
            (identical(other.tdsSet, tdsSet) || other.tdsSet == tdsSet) &&
            (identical(other.tdsHisteresis, tdsHisteresis) ||
                other.tdsHisteresis == tdsHisteresis) &&
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
                other.circulation2 == circulation2) &&
            (identical(other.led, led) || other.led == led) &&
            (identical(other.soc1, soc1) || other.soc1 == soc1) &&
            (identical(other.soc2, soc2) || other.soc2 == soc2) &&
            (identical(other.soc3, soc3) || other.soc3 == soc3) &&
            (identical(other.soc4, soc4) || other.soc4 == soc4) &&
            (identical(other.soc5, soc5) || other.soc5 == soc5) &&
            (identical(other.soc6, soc6) || other.soc6 == soc6) &&
            (identical(other.soc7, soc7) || other.soc7 == soc7));
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
        airTempFreq,
        ph,
        phSet,
        phHisteresis,
        tds,
        tdsSet,
        tdsHisteresis,
        co2,
        co2Min,
        co2Max,
        waterFlow,
        waterFlowMin,
        waterFlowMax,
        pompa1,
        pompa2,
        circulation1,
        circulation2,
        led,
        soc1,
        soc2,
        soc3,
        soc4,
        soc5,
        soc6,
        soc7
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
      final int airTempFreq,
      final double ph,
      final double phSet,
      final double phHisteresis,
      final double tds,
      final double tdsSet,
      final double tdsHisteresis,
      final double co2,
      final double co2Min,
      final double co2Max,
      final double waterFlow,
      final double waterFlowMin,
      final double waterFlowMax,
      final TimerDeviceModel pompa1,
      final TimerDeviceModel pompa2,
      final TimerDeviceModel circulation1,
      final TimerDeviceModel circulation2,
      final TimerDeviceModel led,
      final TimerDeviceModel soc1,
      final TimerDeviceModel soc2,
      final TimerDeviceModel soc3,
      final TimerDeviceModel soc4,
      final TimerDeviceModel soc5,
      final TimerDeviceModel soc6,
      final TimerDeviceModel soc7}) = _$SensorModelImpl;

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
  int get airTempFreq;
  @override
  double get ph;
  @override
  double get phSet;
  @override
  double get phHisteresis;
  @override
  double get tds;
  @override
  double get tdsSet;
  @override
  double get tdsHisteresis;
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
  TimerDeviceModel get pompa1;
  @override
  TimerDeviceModel get pompa2;
  @override
  TimerDeviceModel get circulation1;
  @override
  TimerDeviceModel get circulation2;
  @override
  TimerDeviceModel get led;
  @override
  TimerDeviceModel get soc1;
  @override
  TimerDeviceModel get soc2;
  @override
  TimerDeviceModel get soc3;
  @override
  TimerDeviceModel get soc4;
  @override
  TimerDeviceModel get soc5;
  @override
  TimerDeviceModel get soc6;
  @override
  TimerDeviceModel get soc7;
  @override
  @JsonKey(ignore: true)
  _$$SensorModelImplCopyWith<_$SensorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
