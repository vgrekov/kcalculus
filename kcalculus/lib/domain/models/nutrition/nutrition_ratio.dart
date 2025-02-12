import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';

part 'nutrition_ratio.freezed.dart';
part 'nutrition_ratio.g.dart';

@freezed
class NutritionRatio with _$NutritionRatio {
  const factory NutritionRatio._default({
    required Amount perAmount,
    required Amount totalAmount,
  }) = _NutritionRatio;

  factory NutritionRatio({
    required Amount perAmount,
    required Amount totalAmount,
  }) {
    if (perAmount.unit.measure != totalAmount.unit.measure) {
      throw 'Both perAmount and totalAmount must be of the same measure.';
    }

    return NutritionRatio._default(
      perAmount: perAmount,
      totalAmount: totalAmount,
    );
  }

  factory NutritionRatio.fromJson(Map<String, dynamic> json) =>
      _$NutritionRatioFromJson(json);
}
