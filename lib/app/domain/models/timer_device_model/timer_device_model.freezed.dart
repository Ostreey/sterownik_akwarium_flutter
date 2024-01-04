// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerDeviceModel _$TimerDeviceModelFromJson(Map<String, dynamic> json) {
  return _TimerDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$TimerDeviceModel {
  int get speed => throw _privateConstructorUsedError;
  bool get state => throw _privateConstructorUsedError;
  Timer get timer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerDeviceModelCopyWith<TimerDeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerDeviceModelCopyWith<$Res> {
  factory $TimerDeviceModelCopyWith(
          TimerDeviceModel value, $Res Function(TimerDeviceModel) then) =
      _$TimerDeviceModelCopyWithImpl<$Res, TimerDeviceModel>;
  @useResult
  $Res call({int speed, bool state, Timer timer});

  $TimerCopyWith<$Res> get timer;
}

/// @nodoc
class _$TimerDeviceModelCopyWithImpl<$Res, $Val extends TimerDeviceModel>
    implements $TimerDeviceModelCopyWith<$Res> {
  _$TimerDeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? state = null,
    Object? timer = null,
  }) {
    return _then(_value.copyWith(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerCopyWith<$Res> get timer {
    return $TimerCopyWith<$Res>(_value.timer, (value) {
      return _then(_value.copyWith(timer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerDeviceModelImplCopyWith<$Res>
    implements $TimerDeviceModelCopyWith<$Res> {
  factory _$$TimerDeviceModelImplCopyWith(_$TimerDeviceModelImpl value,
          $Res Function(_$TimerDeviceModelImpl) then) =
      __$$TimerDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int speed, bool state, Timer timer});

  @override
  $TimerCopyWith<$Res> get timer;
}

/// @nodoc
class __$$TimerDeviceModelImplCopyWithImpl<$Res>
    extends _$TimerDeviceModelCopyWithImpl<$Res, _$TimerDeviceModelImpl>
    implements _$$TimerDeviceModelImplCopyWith<$Res> {
  __$$TimerDeviceModelImplCopyWithImpl(_$TimerDeviceModelImpl _value,
      $Res Function(_$TimerDeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? state = null,
    Object? timer = null,
  }) {
    return _then(_$TimerDeviceModelImpl(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerDeviceModelImpl implements _TimerDeviceModel {
  const _$TimerDeviceModelImpl(
      {this.speed = 0, this.state = false, this.timer = const Timer()});

  factory _$TimerDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerDeviceModelImplFromJson(json);

  @override
  @JsonKey()
  final int speed;
  @override
  @JsonKey()
  final bool state;
  @override
  @JsonKey()
  final Timer timer;

  @override
  String toString() {
    return 'TimerDeviceModel(speed: $speed, state: $state, timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerDeviceModelImpl &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.timer, timer) || other.timer == timer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, speed, state, timer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerDeviceModelImplCopyWith<_$TimerDeviceModelImpl> get copyWith =>
      __$$TimerDeviceModelImplCopyWithImpl<_$TimerDeviceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerDeviceModelImplToJson(
      this,
    );
  }
}

abstract class _TimerDeviceModel implements TimerDeviceModel {
  const factory _TimerDeviceModel(
      {final int speed,
      final bool state,
      final Timer timer}) = _$TimerDeviceModelImpl;

  factory _TimerDeviceModel.fromJson(Map<String, dynamic> json) =
      _$TimerDeviceModelImpl.fromJson;

  @override
  int get speed;
  @override
  bool get state;
  @override
  Timer get timer;
  @override
  @JsonKey(ignore: true)
  _$$TimerDeviceModelImplCopyWith<_$TimerDeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timer _$TimerFromJson(Map<String, dynamic> json) {
  return _Timer.fromJson(json);
}

/// @nodoc
mixin _$Timer {
  int get week => throw _privateConstructorUsedError;
  Time get on => throw _privateConstructorUsedError;
  Time get off => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerCopyWith<Timer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerCopyWith<$Res> {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) then) =
      _$TimerCopyWithImpl<$Res, Timer>;
  @useResult
  $Res call({int week, Time on, Time off});

  $TimeCopyWith<$Res> get on;
  $TimeCopyWith<$Res> get off;
}

/// @nodoc
class _$TimerCopyWithImpl<$Res, $Val extends Timer>
    implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? on = null,
    Object? off = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get on {
    return $TimeCopyWith<$Res>(_value.on, (value) {
      return _then(_value.copyWith(on: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get off {
    return $TimeCopyWith<$Res>(_value.off, (value) {
      return _then(_value.copyWith(off: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerImplCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$$TimerImplCopyWith(
          _$TimerImpl value, $Res Function(_$TimerImpl) then) =
      __$$TimerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int week, Time on, Time off});

  @override
  $TimeCopyWith<$Res> get on;
  @override
  $TimeCopyWith<$Res> get off;
}

/// @nodoc
class __$$TimerImplCopyWithImpl<$Res>
    extends _$TimerCopyWithImpl<$Res, _$TimerImpl>
    implements _$$TimerImplCopyWith<$Res> {
  __$$TimerImplCopyWithImpl(
      _$TimerImpl _value, $Res Function(_$TimerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? on = null,
    Object? off = null,
  }) {
    return _then(_$TimerImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerImpl implements _Timer {
  const _$TimerImpl(
      {this.week = 127, this.on = const Time(), this.off = const Time()});

  factory _$TimerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerImplFromJson(json);

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
  String toString() {
    return 'Timer(week: $week, on: $on, off: $off)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.on, on) || other.on == on) &&
            (identical(other.off, off) || other.off == off));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, week, on, off);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerImplCopyWith<_$TimerImpl> get copyWith =>
      __$$TimerImplCopyWithImpl<_$TimerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerImplToJson(
      this,
    );
  }
}

abstract class _Timer implements Timer {
  const factory _Timer({final int week, final Time on, final Time off}) =
      _$TimerImpl;

  factory _Timer.fromJson(Map<String, dynamic> json) = _$TimerImpl.fromJson;

  @override
  int get week;
  @override
  Time get on;
  @override
  Time get off;
  @override
  @JsonKey(ignore: true)
  _$$TimerImplCopyWith<_$TimerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Time _$TimeFromJson(Map<String, dynamic> json) {
  return _Time.fromJson(json);
}

/// @nodoc
mixin _$Time {
  int get h => throw _privateConstructorUsedError;
  int get m => throw _privateConstructorUsedError;
  int get s => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCopyWith<Time> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) then) =
      _$TimeCopyWithImpl<$Res, Time>;
  @useResult
  $Res call({int h, int m, int s});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res, $Val extends Time>
    implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? h = null,
    Object? m = null,
    Object? s = null,
  }) {
    return _then(_value.copyWith(
      h: null == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as int,
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as int,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeImplCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$$TimeImplCopyWith(
          _$TimeImpl value, $Res Function(_$TimeImpl) then) =
      __$$TimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int h, int m, int s});
}

/// @nodoc
class __$$TimeImplCopyWithImpl<$Res>
    extends _$TimeCopyWithImpl<$Res, _$TimeImpl>
    implements _$$TimeImplCopyWith<$Res> {
  __$$TimeImplCopyWithImpl(_$TimeImpl _value, $Res Function(_$TimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? h = null,
    Object? m = null,
    Object? s = null,
  }) {
    return _then(_$TimeImpl(
      h: null == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as int,
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as int,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeImpl implements _Time {
  const _$TimeImpl({this.h = 0, this.m = 0, this.s = 0});

  factory _$TimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeImplFromJson(json);

  @override
  @JsonKey()
  final int h;
  @override
  @JsonKey()
  final int m;
  @override
  @JsonKey()
  final int s;

  @override
  String toString() {
    return 'Time(h: $h, m: $m, s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeImpl &&
            (identical(other.h, h) || other.h == h) &&
            (identical(other.m, m) || other.m == m) &&
            (identical(other.s, s) || other.s == s));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, h, m, s);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeImplCopyWith<_$TimeImpl> get copyWith =>
      __$$TimeImplCopyWithImpl<_$TimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeImplToJson(
      this,
    );
  }
}

abstract class _Time implements Time {
  const factory _Time({final int h, final int m, final int s}) = _$TimeImpl;

  factory _Time.fromJson(Map<String, dynamic> json) = _$TimeImpl.fromJson;

  @override
  int get h;
  @override
  int get m;
  @override
  int get s;
  @override
  @JsonKey(ignore: true)
  _$$TimeImplCopyWith<_$TimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
