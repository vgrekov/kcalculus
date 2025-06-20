import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';

part 'nutrition_facts_input_view_model_arg.freezed.dart';

@freezed
sealed class NutritionFactsInputViewModelArg
    with _$NutritionFactsInputViewModelArg {
  const factory NutritionFactsInputViewModelArg({
    List<NutritionFacts>? nutritionFacts,
    required List<Nutrient> defaultNutrients,
  }) = _NutritionFactsInputViewModelArg;
}
