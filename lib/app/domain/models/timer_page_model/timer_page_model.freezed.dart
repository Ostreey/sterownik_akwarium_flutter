// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerPageModel _$TimerPageModelFromJson(Map<String, dynamic> json) {
  return _TimerPageModel.fromJson(json);
}

/// @nodoc
mixin _$TimerPageModel {
  String get appBarTitle => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  TimerDeviceModel get timerDeviceModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerPageModelCopyWith<TimerPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerPageModelCopyWith<$Res> {
  factory $TimerPageModelCopyWith(
          TimerPageModel value, $Res Function(TimerPageModel) then) =
      _$TimerPageModelCopyWithImpl<$Res, TimerPageModel>;
  @useResult
  $Res call(
      {String appBarTitle, String endpoint, TimerDeviceModel timerDeviceModel});

  $TimerDeviceModelCopyWith<$Res> get timerDeviceModel;
}

/// @nodoc
class _$TimerPageModelCopyWithImpl<$Res, $Val extends TimerPageModel>
    implements $TimerPageModelCopyWith<$Res> {
  _$TimerPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBarTitle = null,
    Object? endpoint = null,
    Object? timerDeviceModel = null,
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
      timerDeviceModel: null == timerDeviceModel
          ? _value.timerDeviceModel
          : timerDeviceModel // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerDeviceModelCopyWith<$Res> get timerDeviceModel {
    return $TimerDeviceModelCopyWith<$Res>(_value.timerDeviceModel, (value) {
      return _then(_value.copyWith(timerDeviceModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerPageModelImplCopyWith<$Res>
    implements $TimerPageModelCopyWith<$Res> {
  factory _$$TimerPageModelImplCopyWith(_$TimerPageModelImpl value,
          $Res Function(_$TimerPageModelImpl) then) =
      __$$TimerPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appBarTitle, String endpoint, TimerDeviceModel timerDeviceModel});

  @override
  $TimerDeviceModelCopyWith<$Res> get timerDeviceModel;
}

/// @nodoc
class __$$TimerPageModelImplCopyWithImpl<$Res>
    extends _$TimerPageModelCopyWithImpl<$Res, _$TimerPageModelImpl>
    implements _$$TimerPageModelImplCopyWith<$Res> {
  __$$TimerPageModelImplCopyWithImpl(
      _$TimerPageModelImpl _value, $Res Function(_$TimerPageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBarTitle = null,
    Object? endpoint = null,
    Object? timerDeviceModel = null,
  }) {
    return _then(_$TimerPageModelImpl(
      appBarTitle: null == appBarTitle
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      timerDeviceModel: null == timerDeviceModel
          ? _value.timerDeviceModel
          : timerDeviceModel // ignore: cast_nullable_to_non_nullable
              as TimerDeviceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerPageModelImpl implements _TimerPageModel {
  const _$TimerPageModelImpl(
      {required this.appBarTitle,
      required this.endpoint,
      required this.timerDeviceModel});

  factory _$TimerPageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerPageModelImplFromJson(json);

  @override
  final String appBarTitle;
  @override
  final String endpoint;
  @override
  final TimerDeviceModel timerDeviceModel;

  @override
  String toString() {
    return 'TimerPageModel(appBarTitle: $appBarTitle, endpoint: $endpoint, timerDeviceModel: $timerDeviceModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerPageModelImpl &&
            (identical(other.appBarTitle, appBarTitle) ||
                other.appBarTitle == appBarTitle) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.timerDeviceModel, timerDeviceModel) ||
                other.timerDeviceModel == timerDeviceModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, appBarTitle, endpoint, timerDeviceModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerPageModelImplCopyWith<_$TimerPageModelImpl> get copyWith =>
      __$$TimerPageModelImplCopyWithImpl<_$TimerPageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerPageModelImplToJson(
      this,
    );
  }
}

abstract class _TimerPageModel implements TimerPageModel {
  const factory _TimerPageModel(
      {required final String appBarTitle,
      required final String endpoint,
      required final TimerDeviceModel timerDeviceModel}) = _$TimerPageModelImpl;

  factory _TimerPageModel.fromJson(Map<String, dynamic> json) =
      _$TimerPageModelImpl.fromJson;

  @override
  String get appBarTitle;
  @override
  String get endpoint;
  @override
  TimerDeviceModel get timerDeviceModel;
  @override
  @JsonKey(ignore: true)
  _$$TimerPageModelImplCopyWith<_$TimerPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
