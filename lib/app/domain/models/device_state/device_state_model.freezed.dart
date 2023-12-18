// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceStateModel _$DeviceStateModelFromJson(Map<String, dynamic> json) {
  return _DeviceStateModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceStateModel {
  bool get state => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;
  String get timerOn => throw _privateConstructorUsedError;
  String get timerOff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceStateModelCopyWith<DeviceStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateModelCopyWith<$Res> {
  factory $DeviceStateModelCopyWith(
          DeviceStateModel value, $Res Function(DeviceStateModel) then) =
      _$DeviceStateModelCopyWithImpl<$Res, DeviceStateModel>;
  @useResult
  $Res call({bool state, int speed, String timerOn, String timerOff});
}

/// @nodoc
class _$DeviceStateModelCopyWithImpl<$Res, $Val extends DeviceStateModel>
    implements $DeviceStateModelCopyWith<$Res> {
  _$DeviceStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? speed = null,
    Object? timerOn = null,
    Object? timerOff = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      timerOn: null == timerOn
          ? _value.timerOn
          : timerOn // ignore: cast_nullable_to_non_nullable
              as String,
      timerOff: null == timerOff
          ? _value.timerOff
          : timerOff // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceStateModelImplCopyWith<$Res>
    implements $DeviceStateModelCopyWith<$Res> {
  factory _$$DeviceStateModelImplCopyWith(_$DeviceStateModelImpl value,
          $Res Function(_$DeviceStateModelImpl) then) =
      __$$DeviceStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool state, int speed, String timerOn, String timerOff});
}

/// @nodoc
class __$$DeviceStateModelImplCopyWithImpl<$Res>
    extends _$DeviceStateModelCopyWithImpl<$Res, _$DeviceStateModelImpl>
    implements _$$DeviceStateModelImplCopyWith<$Res> {
  __$$DeviceStateModelImplCopyWithImpl(_$DeviceStateModelImpl _value,
      $Res Function(_$DeviceStateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? speed = null,
    Object? timerOn = null,
    Object? timerOff = null,
  }) {
    return _then(_$DeviceStateModelImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      timerOn: null == timerOn
          ? _value.timerOn
          : timerOn // ignore: cast_nullable_to_non_nullable
              as String,
      timerOff: null == timerOff
          ? _value.timerOff
          : timerOff // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceStateModelImpl implements _DeviceStateModel {
  const _$DeviceStateModelImpl(
      {this.state = false,
      this.speed = 0,
      this.timerOn = "",
      this.timerOff = ""});

  factory _$DeviceStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceStateModelImplFromJson(json);

  @override
  @JsonKey()
  final bool state;
  @override
  @JsonKey()
  final int speed;
  @override
  @JsonKey()
  final String timerOn;
  @override
  @JsonKey()
  final String timerOff;

  @override
  String toString() {
    return 'DeviceStateModel(state: $state, speed: $speed, timerOn: $timerOn, timerOff: $timerOff)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceStateModelImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.timerOn, timerOn) || other.timerOn == timerOn) &&
            (identical(other.timerOff, timerOff) ||
                other.timerOff == timerOff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, speed, timerOn, timerOff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceStateModelImplCopyWith<_$DeviceStateModelImpl> get copyWith =>
      __$$DeviceStateModelImplCopyWithImpl<_$DeviceStateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceStateModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceStateModel implements DeviceStateModel {
  const factory _DeviceStateModel(
      {final bool state,
      final int speed,
      final String timerOn,
      final String timerOff}) = _$DeviceStateModelImpl;

  factory _DeviceStateModel.fromJson(Map<String, dynamic> json) =
      _$DeviceStateModelImpl.fromJson;

  @override
  bool get state;
  @override
  int get speed;
  @override
  String get timerOn;
  @override
  String get timerOff;
  @override
  @JsonKey(ignore: true)
  _$$DeviceStateModelImplCopyWith<_$DeviceStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
