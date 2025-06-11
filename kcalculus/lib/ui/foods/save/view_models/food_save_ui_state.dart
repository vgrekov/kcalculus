import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';

part 'food_save_ui_state.freezed.dart';

@freezed
sealed class FoodSaveUiState with _$FoodSaveUiState {
  const FoodSaveUiState._();

  const factory FoodSaveUiState({
    String? id,
    @Default('') String name,
    @Default('') String description,
    List<NutritionFacts>? nutritionFacts,
  }) = _FoodSaveUiState;

  Food toFood() {
    return Food(
      id: id,
      name: name,
      description: description,
      nutritionFacts: nutritionFacts!,
    );
  }
}
