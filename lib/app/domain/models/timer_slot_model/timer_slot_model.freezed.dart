// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerSlotModel _$TimerSlotModelFromJson(Map<String, dynamic> json) {
  return _TimerSlotModel.fromJson(json);
}

/// @nodoc
mixin _$TimerSlotModel {
  int get i => throw _privateConstructorUsedError;
  int get repeat => throw _privateConstructorUsedError;
  int get week => throw _privateConstructorUsedError;
  Time get on => throw _privateConstructorUsedError;
  Time get off => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  /// Serializes this TimerSlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimerSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerSlotModelCopyWith<TimerSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSlotModelCopyWith<$Res> {
  factory $TimerSlotModelCopyWith(
          TimerSlotModel value, $Res Function(TimerSlotModel) then) =
      _$TimerSlotModelCopyWithImpl<$Res, TimerSlotModel>;
  @useResult
  $Res call({int i, int repeat, int week, Time on, Time off, int speed});

  $TimeCopyWith<$Res> get on;
  $TimeCopyWith<$Res> get off;
}

/// @nodoc
class _$TimerSlotModelCopyWithImpl<$Res, $Val extends TimerSlotModel>
    implements $TimerSlotModelCopyWith<$Res> {
  _$TimerSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? i = null,
    Object? repeat = null,
    Object? week = null,
    Object? on = null,
    Object? off = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      i: null == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      on: null == on
          ? _value.on
          : on // ignore: cast_nullable_to_non_nullable
              as Time,
      off: null == off
          ? _value.off
          : off // ignore: cast_nullable_to_non_nullable
              as Time,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of TimerSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get on {
    return $TimeCopyWith<$Res>(_value.on, (value) {
      return _then(_value.copyWith(on: value) as $Val);
    });
  }

  /// Create a copy of TimerSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get off {
    return $TimeCopyWith<$Res>(_value.off, (value) {
      return _then(_value.copyWith(off: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerSlotModelImplCopyWith<$Res>
    implements $TimerSlotModelCopyWith<$Res> {
  factory _$$TimerSlotModelImplCopyWith(_$TimerSlotModelImpl value,
          $Res Function(_$TimerSlotModelImpl) then) =
      __$$TimerSlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int i, int repeat, int week, Time on, Time off, int speed});

  @override
  $TimeCopyWith<$Res> get on;
  @override
  $TimeCopyWith<$Res> get off;
}

/// @nodoc
class __$$TimerSlotModelImplCopyWithImpl<$Res>
    extends _$TimerSlotModelCopyWithImpl<$Res, _$TimerSlotModelImpl>
    implements _$$TimerSlotModelImplCopyWith<$Res> {
  __$$TimerSlotModelImplCopyWithImpl(
      _$TimerSlotModelImpl _value, $Res Function(_$TimerSlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? i = null,
    Object? repeat = null,
    Object? week = null,
    Object? on = null,
    Object? off = null,
    Object? speed = null,
  }) {
    return _then(_$TimerSlotModelImpl(
      i: null == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      on: null == on
          ? _value.on
          : on // ignore: cast_nullable_to_non_nullable
              as Time,
      off: null == off
          ? _value.off
          : off // ignore: cast_nullable_to_non_nullable
              as Time,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerSlotModelImpl implements _TimerSlotModel {
  const _$TimerSlotModelImpl(
      {this.i = 0,
      this.repeat = 0,
      this.week = 127,
      this.on = const Time(),
      this.off = const Time(),
      this.speed = 0});

  factory _$TimerSlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerSlotModelImplFromJson(json);

  @override
  @JsonKey()
  final int i;
  @override
  @JsonKey()
  final int repeat;
  @override
  @JsonKey()
  final int week;
  @override
  @JsonKey()
  final Time on;
  @override
  @JsonKey()
  final Time off;
  @override
  @JsonKey()
  final int speed;

  @override
  String toString() {
    return 'TimerSlotModel(i: $i, repeat: $repeat, week: $week, on: $on, off: $off, speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSlotModelImpl &&
            (identical(other.i, i) || other.i == i) &&
            (identical(other.repeat, repeat) || other.repeat == repeat) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.on, on) || other.on == on) &&
            (identical(other.off, off) || other.off == off) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, i, repeat, week, on, off, speed);

  /// Create a copy of TimerSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSlotModelImplCopyWith<_$TimerSlotModelImpl> get copyWith =>
      __$$TimerSlotModelImplCopyWithImpl<_$TimerSlotModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerSlotModelImplToJson(
      this,
    );
  }
}

abstract class _TimerSlotModel implements TimerSlotModel {
  const factory _TimerSlotModel(
      {final int i,
      final int repeat,
      final int week,
      final Time on,
      final Time off,
      final int speed}) = _$TimerSlotModelImpl;

  factory _TimerSlotModel.fromJson(Map<String, dynamic> json) =
      _$TimerSlotModelImpl.fromJson;

  @override
  int get i;
  @override
  int get repeat;
  @override
  int get week;
  @override
  Time get on;
  @override
  Time get off;
  @override
  int get speed;

  /// Create a copy of TimerSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerSlotModelImplCopyWith<_$TimerSlotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
