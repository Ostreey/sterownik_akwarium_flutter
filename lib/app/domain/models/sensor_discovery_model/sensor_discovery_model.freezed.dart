// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_discovery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SensorDiscoveryModel _$SensorDiscoveryModelFromJson(Map<String, dynamic> json) {
  return _SensorDiscoveryModel.fromJson(json);
}

/// @nodoc
mixin _$SensorDiscoveryModel {
  List<String> get sensors => throw _privateConstructorUsedError;

  /// Serializes this SensorDiscoveryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SensorDiscoveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SensorDiscoveryModelCopyWith<SensorDiscoveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorDiscoveryModelCopyWith<$Res> {
  factory $SensorDiscoveryModelCopyWith(SensorDiscoveryModel value,
          $Res Function(SensorDiscoveryModel) then) =
      _$SensorDiscoveryModelCopyWithImpl<$Res, SensorDiscoveryModel>;
  @useResult
  $Res call({List<String> sensors});
}

/// @nodoc
class _$SensorDiscoveryModelCopyWithImpl<$Res,
        $Val extends SensorDiscoveryModel>
    implements $SensorDiscoveryModelCopyWith<$Res> {
  _$SensorDiscoveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SensorDiscoveryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensors = null,
  }) {
    return _then(_value.copyWith(
      sensors: null == sensors
          ? _value.sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SensorDiscoveryModelImplCopyWith<$Res>
    implements $SensorDiscoveryModelCopyWith<$Res> {
  factory _$$SensorDiscoveryModelImplCopyWith(_$SensorDiscoveryModelImpl value,
          $Res Function(_$SensorDiscoveryModelImpl) then) =
      __$$SensorDiscoveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> sensors});
}

/// @nodoc
class __$$SensorDiscoveryModelImplCopyWithImpl<$Res>
    extends _$SensorDiscoveryModelCopyWithImpl<$Res, _$SensorDiscoveryModelImpl>
    implements _$$SensorDiscoveryModelImplCopyWith<$Res> {
  __$$SensorDiscoveryModelImplCopyWithImpl(_$SensorDiscoveryModelImpl _value,
      $Res Function(_$SensorDiscoveryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorDiscoveryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensors = null,
  }) {
    return _then(_$SensorDiscoveryModelImpl(
      sensors: null == sensors
          ? _value._sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SensorDiscoveryModelImpl implements _SensorDiscoveryModel {
  const _$SensorDiscoveryModelImpl({final List<String> sensors = const []})
      : _sensors = sensors;

  factory _$SensorDiscoveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SensorDiscoveryModelImplFromJson(json);

  final List<String> _sensors;
  @override
  @JsonKey()
  List<String> get sensors {
    if (_sensors is EqualUnmodifiableListView) return _sensors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sensors);
  }

  @override
  String toString() {
    return 'SensorDiscoveryModel(sensors: $sensors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorDiscoveryModelImpl &&
            const DeepCollectionEquality().equals(other._sensors, _sensors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sensors));

  /// Create a copy of SensorDiscoveryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorDiscoveryModelImplCopyWith<_$SensorDiscoveryModelImpl>
      get copyWith =>
          __$$SensorDiscoveryModelImplCopyWithImpl<_$SensorDiscoveryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SensorDiscoveryModelImplToJson(
      this,
    );
  }
}

abstract class _SensorDiscoveryModel implements SensorDiscoveryModel {
  const factory _SensorDiscoveryModel({final List<String> sensors}) =
      _$SensorDiscoveryModelImpl;

  factory _SensorDiscoveryModel.fromJson(Map<String, dynamic> json) =
      _$SensorDiscoveryModelImpl.fromJson;

  @override
  List<String> get sensors;

  /// Create a copy of SensorDiscoveryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SensorDiscoveryModelImplCopyWith<_$SensorDiscoveryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
