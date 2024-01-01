import 'package:freezed_annotation/freezed_annotation.dart';
part 'parameters_edit_page_model.freezed.dart';
part 'parameters_edit_page_model.g.dart';

@freezed
class ParametersEditPageModel with _$ParametersEditPageModel {
  const factory ParametersEditPageModel({
    required String appBarTitle,
    required String endpoint,
    required double minValue,
    required double maxValue,
    required double currentValue,
    required String unit,
    @Default(-1) int frequency,

  }) = _ParametersEditPageModel;

  factory ParametersEditPageModel.fromJson(Map<String, dynamic> json) =>
      _$ParametersEditPageModelFromJson(json);
}
