// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parameters_edit_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParametersEditPageModel _$ParametersEditPageModelFromJson(
    Map<String, dynamic> json) {
  return _ParametersEditPageModel.fromJson(json);
}

/// @nodoc
mixin _$ParametersEditPageModel {
  String get appBarTitle => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  double get minValue => throw _privateConstructorUsedError;
  double get maxValue => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParametersEditPageModelCopyWith<ParametersEditPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParametersEditPageModelCopyWith<$Res> {
  factory $ParametersEditPageModelCopyWith(ParametersEditPageModel value,
          $Res Function(ParametersEditPageModel) then) =
      _$ParametersEditPageModelCopyWithImpl<$Res, ParametersEditPageModel>;
  @useResult
  $Res call(
      {String appBarTitle,
      String endpoint,
      double minValue,
      double maxValue,
      double currentValue,
      String unit});
}

/// @nodoc
class _$ParametersEditPageModelCopyWithImpl<$Res,
        $Val extends ParametersEditPageModel>
    implements $ParametersEditPageModelCopyWith<$Res> {
  _$ParametersEditPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBarTitle = null,
    Object? endpoint = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? currentValue = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      appBarTitle: null == appBarTitle
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParametersEditPageModelImplCopyWith<$Res>
    implements $ParametersEditPageModelCopyWith<$Res> {
  factory _$$ParametersEditPageModelImplCopyWith(
          _$ParametersEditPageModelImpl value,
          $Res Function(_$ParametersEditPageModelImpl) then) =
      __$$ParametersEditPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appBarTitle,
      String endpoint,
      double minValue,
      double maxValue,
      double currentValue,
      String unit});
}

/// @nodoc
class __$$ParametersEditPageModelImplCopyWithImpl<$Res>
    extends _$ParametersEditPageModelCopyWithImpl<$Res,
        _$ParametersEditPageModelImpl>
    implements _$$ParametersEditPageModelImplCopyWith<$Res> {
  __$$ParametersEditPageModelImplCopyWithImpl(
      _$ParametersEditPageModelImpl _value,
      $Res Function(_$ParametersEditPageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBarTitle = null,
    Object? endpoint = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? currentValue = null,
    Object? unit = null,
  }) {
    return _then(_$ParametersEditPageModelImpl(
      appBarTitle: null == appBarTitle
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParametersEditPageModelImpl implements _ParametersEditPageModel {
  const _$ParametersEditPageModelImpl(
      {required this.appBarTitle,
      required this.endpoint,
      required this.minValue,
      required this.maxValue,
      required this.currentValue,
      required this.unit});

  factory _$ParametersEditPageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParametersEditPageModelImplFromJson(json);

  @override
  final String appBarTitle;
  @override
  final String endpoint;
  @override
  final double minValue;
  @override
  final double maxValue;
  @override
  final double currentValue;
  @override
  final String unit;

  @override
  String toString() {
    return 'ParametersEditPageModel(appBarTitle: $appBarTitle, endpoint: $endpoint, minValue: $minValue, maxValue: $maxValue, currentValue: $currentValue, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParametersEditPageModelImpl &&
            (identical(other.appBarTitle, appBarTitle) ||
                other.appBarTitle == appBarTitle) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appBarTitle, endpoint, minValue,
      maxValue, currentValue, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParametersEditPageModelImplCopyWith<_$ParametersEditPageModelImpl>
      get copyWith => __$$ParametersEditPageModelImplCopyWithImpl<
          _$ParametersEditPageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParametersEditPageModelImplToJson(
      this,
    );
  }
}

abstract class _ParametersEditPageModel implements ParametersEditPageModel {
  const factory _ParametersEditPageModel(
      {required final String appBarTitle,
      required final String endpoint,
      required final double minValue,
      required final double maxValue,
      required final double currentValue,
      required final String unit}) = _$ParametersEditPageModelImpl;

  factory _ParametersEditPageModel.fromJson(Map<String, dynamic> json) =
      _$ParametersEditPageModelImpl.fromJson;

  @override
  String get appBarTitle;
  @override
  String get endpoint;
  @override
  double get minValue;
  @override
  double get maxValue;
  @override
  double get currentValue;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$ParametersEditPageModelImplCopyWith<_$ParametersEditPageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
