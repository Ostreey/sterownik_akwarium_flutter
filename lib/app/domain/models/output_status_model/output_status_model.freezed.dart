// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'output_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutputStatusModel _$OutputStatusModelFromJson(Map<String, dynamic> json) {
  return _OutputStatusModel.fromJson(json);
}

/// @nodoc
mixin _$OutputStatusModel {
  bool get state => throw _privateConstructorUsedError;
  bool get alarmHigh => throw _privateConstructorUsedError;
  bool get alarmLow => throw _privateConstructorUsedError;
  bool get manual => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;

  /// Serializes this OutputStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutputStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutputStatusModelCopyWith<OutputStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputStatusModelCopyWith<$Res> {
  factory $OutputStatusModelCopyWith(
          OutputStatusModel value, $Res Function(OutputStatusModel) then) =
      _$OutputStatusModelCopyWithImpl<$Res, OutputStatusModel>;
  @useResult
  $Res call(
      {bool state, bool alarmHigh, bool alarmLow, bool manual, bool blocked});
}

/// @nodoc
class _$OutputStatusModelCopyWithImpl<$Res, $Val extends OutputStatusModel>
    implements $OutputStatusModelCopyWith<$Res> {
  _$OutputStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutputStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? alarmHigh = null,
    Object? alarmLow = null,
    Object? manual = null,
    Object? blocked = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      alarmHigh: null == alarmHigh
          ? _value.alarmHigh
          : alarmHigh // ignore: cast_nullable_to_non_nullable
              as bool,
      alarmLow: null == alarmLow
          ? _value.alarmLow
          : alarmLow // ignore: cast_nullable_to_non_nullable
              as bool,
      manual: null == manual
          ? _value.manual
          : manual // ignore: cast_nullable_to_non_nullable
              as bool,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutputStatusModelImplCopyWith<$Res>
    implements $OutputStatusModelCopyWith<$Res> {
  factory _$$OutputStatusModelImplCopyWith(_$OutputStatusModelImpl value,
          $Res Function(_$OutputStatusModelImpl) then) =
      __$$OutputStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool state, bool alarmHigh, bool alarmLow, bool manual, bool blocked});
}

/// @nodoc
class __$$OutputStatusModelImplCopyWithImpl<$Res>
    extends _$OutputStatusModelCopyWithImpl<$Res, _$OutputStatusModelImpl>
    implements _$$OutputStatusModelImplCopyWith<$Res> {
  __$$OutputStatusModelImplCopyWithImpl(_$OutputStatusModelImpl _value,
      $Res Function(_$OutputStatusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutputStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? alarmHigh = null,
    Object? alarmLow = null,
    Object? manual = null,
    Object? blocked = null,
  }) {
    return _then(_$OutputStatusModelImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      alarmHigh: null == alarmHigh
          ? _value.alarmHigh
          : alarmHigh // ignore: cast_nullable_to_non_nullable
              as bool,
      alarmLow: null == alarmLow
          ? _value.alarmLow
          : alarmLow // ignore: cast_nullable_to_non_nullable
              as bool,
      manual: null == manual
          ? _value.manual
          : manual // ignore: cast_nullable_to_non_nullable
              as bool,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutputStatusModelImpl implements _OutputStatusModel {
  const _$OutputStatusModelImpl(
      {this.state = false,
      this.alarmHigh = false,
      this.alarmLow = false,
      this.manual = false,
      this.blocked = false});

  factory _$OutputStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutputStatusModelImplFromJson(json);

  @override
  @JsonKey()
  final bool state;
  @override
  @JsonKey()
  final bool alarmHigh;
  @override
  @JsonKey()
  final bool alarmLow;
  @override
  @JsonKey()
  final bool manual;
  @override
  @JsonKey()
  final bool blocked;

  @override
  String toString() {
    return 'OutputStatusModel(state: $state, alarmHigh: $alarmHigh, alarmLow: $alarmLow, manual: $manual, blocked: $blocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputStatusModelImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.alarmHigh, alarmHigh) ||
                other.alarmHigh == alarmHigh) &&
            (identical(other.alarmLow, alarmLow) ||
                other.alarmLow == alarmLow) &&
            (identical(other.manual, manual) || other.manual == manual) &&
            (identical(other.blocked, blocked) || other.blocked == blocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, state, alarmHigh, alarmLow, manual, blocked);

  /// Create a copy of OutputStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputStatusModelImplCopyWith<_$OutputStatusModelImpl> get copyWith =>
      __$$OutputStatusModelImplCopyWithImpl<_$OutputStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutputStatusModelImplToJson(
      this,
    );
  }
}

abstract class _OutputStatusModel implements OutputStatusModel {
  const factory _OutputStatusModel(
      {final bool state,
      final bool alarmHigh,
      final bool alarmLow,
      final bool manual,
      final bool blocked}) = _$OutputStatusModelImpl;

  factory _OutputStatusModel.fromJson(Map<String, dynamic> json) =
      _$OutputStatusModelImpl.fromJson;

  @override
  bool get state;
  @override
  bool get alarmHigh;
  @override
  bool get alarmLow;
  @override
  bool get manual;
  @override
  bool get blocked;

  /// Create a copy of OutputStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutputStatusModelImplCopyWith<_$OutputStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
