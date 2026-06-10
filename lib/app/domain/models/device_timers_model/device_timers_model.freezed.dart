// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_timers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceTimersModel _$DeviceTimersModelFromJson(Map<String, dynamic> json) {
  return _DeviceTimersModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceTimersModel {
  String get device => throw _privateConstructorUsedError;
  bool get pwm => throw _privateConstructorUsedError;
  List<TimerSlotModel> get timers => throw _privateConstructorUsedError;

  /// Serializes this DeviceTimersModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceTimersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceTimersModelCopyWith<DeviceTimersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceTimersModelCopyWith<$Res> {
  factory $DeviceTimersModelCopyWith(
          DeviceTimersModel value, $Res Function(DeviceTimersModel) then) =
      _$DeviceTimersModelCopyWithImpl<$Res, DeviceTimersModel>;
  @useResult
  $Res call({String device, bool pwm, List<TimerSlotModel> timers});
}

/// @nodoc
class _$DeviceTimersModelCopyWithImpl<$Res, $Val extends DeviceTimersModel>
    implements $DeviceTimersModelCopyWith<$Res> {
  _$DeviceTimersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceTimersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? pwm = null,
    Object? timers = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      pwm: null == pwm
          ? _value.pwm
          : pwm // ignore: cast_nullable_to_non_nullable
              as bool,
      timers: null == timers
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as List<TimerSlotModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceTimersModelImplCopyWith<$Res>
    implements $DeviceTimersModelCopyWith<$Res> {
  factory _$$DeviceTimersModelImplCopyWith(_$DeviceTimersModelImpl value,
          $Res Function(_$DeviceTimersModelImpl) then) =
      __$$DeviceTimersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String device, bool pwm, List<TimerSlotModel> timers});
}

/// @nodoc
class __$$DeviceTimersModelImplCopyWithImpl<$Res>
    extends _$DeviceTimersModelCopyWithImpl<$Res, _$DeviceTimersModelImpl>
    implements _$$DeviceTimersModelImplCopyWith<$Res> {
  __$$DeviceTimersModelImplCopyWithImpl(_$DeviceTimersModelImpl _value,
      $Res Function(_$DeviceTimersModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceTimersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? pwm = null,
    Object? timers = null,
  }) {
    return _then(_$DeviceTimersModelImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      pwm: null == pwm
          ? _value.pwm
          : pwm // ignore: cast_nullable_to_non_nullable
              as bool,
      timers: null == timers
          ? _value._timers
          : timers // ignore: cast_nullable_to_non_nullable
              as List<TimerSlotModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceTimersModelImpl implements _DeviceTimersModel {
  const _$DeviceTimersModelImpl(
      {this.device = '',
      this.pwm = false,
      final List<TimerSlotModel> timers = const <TimerSlotModel>[]})
      : _timers = timers;

  factory _$DeviceTimersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceTimersModelImplFromJson(json);

  @override
  @JsonKey()
  final String device;
  @override
  @JsonKey()
  final bool pwm;
  final List<TimerSlotModel> _timers;
  @override
  @JsonKey()
  List<TimerSlotModel> get timers {
    if (_timers is EqualUnmodifiableListView) return _timers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timers);
  }

  @override
  String toString() {
    return 'DeviceTimersModel(device: $device, pwm: $pwm, timers: $timers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceTimersModelImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.pwm, pwm) || other.pwm == pwm) &&
            const DeepCollectionEquality().equals(other._timers, _timers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, device, pwm, const DeepCollectionEquality().hash(_timers));

  /// Create a copy of DeviceTimersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceTimersModelImplCopyWith<_$DeviceTimersModelImpl> get copyWith =>
      __$$DeviceTimersModelImplCopyWithImpl<_$DeviceTimersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceTimersModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceTimersModel implements DeviceTimersModel {
  const factory _DeviceTimersModel(
      {final String device,
      final bool pwm,
      final List<TimerSlotModel> timers}) = _$DeviceTimersModelImpl;

  factory _DeviceTimersModel.fromJson(Map<String, dynamic> json) =
      _$DeviceTimersModelImpl.fromJson;

  @override
  String get device;
  @override
  bool get pwm;
  @override
  List<TimerSlotModel> get timers;

  /// Create a copy of DeviceTimersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceTimersModelImplCopyWith<_$DeviceTimersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
