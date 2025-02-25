// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutriments_api_model.freezed.dart';
part 'nutriments_api_model.g.dart';

@freezed
class NutrimentsApiModel with _$NutrimentsApiModel {
  const factory NutrimentsApiModel({
    @JsonKey(
      name: 'energy-kcal',
    )
    required double energy_kcal,
    required String? fat_unit,
    required double? fat_value,
    required String? carbohydrates_unit,
    required double? carbohydrates_value,
    required String? fiber_unit,
    required double? fiber_value,
    required String? proteins_unit,
    required double? proteins_value,
  }) = _NutrimentsApiModel;

  factory NutrimentsApiModel.fromJson(Map<String, dynamic> json) =>
      _$NutrimentsApiModelFromJson(json);
}
