import 'package:freezed_annotation/freezed_annotation.dart';

part 'usda_portion_dto_model.freezed.dart';
part 'usda_portion_dto_model.g.dart';

@freezed
sealed class UsdaPortionDtoModel with _$UsdaPortionDtoModel {
  const factory UsdaPortionDtoModel({
    required int measureUnitId,
    double? amount,
    required double gramWeight,
  }) = _UsdaPortionDtoModel;

  factory UsdaPortionDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaPortionDtoModelFromJson(json);
}
