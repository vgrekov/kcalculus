import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';

part 'nutrition_facts_view_view_model_arg.freezed.dart';

@freezed
sealed class NutritionFactsViewViewModelArg
    with _$NutritionFactsViewViewModelArg {
  const factory NutritionFactsViewViewModelArg({
    required List<NutritionFacts> nutritionFacts,
    required List<Nutrient> nutrientDefaults,
  }) = _NutritionFactsViewViewModelArg;
}
