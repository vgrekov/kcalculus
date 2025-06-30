import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient_data_v1.freezed.dart';
part 'nutrient_data_v1.g.dart';

@freezed
sealed class NutrientDataV1 with _$NutrientDataV1 {
  const factory NutrientDataV1({
    required double calories,
    required double fatInGrams,
    required double carbsInGrams,
    required double fiberInGrams,
    required double proteinInGrams,
  }) = _NutrientDataV1;

  factory NutrientDataV1.fromJson(Map<String, dynamic> json) =>
      _$NutrientDataV1FromJson(json);
}
