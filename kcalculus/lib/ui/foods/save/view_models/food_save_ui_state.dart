import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';

part 'food_save_ui_state.freezed.dart';

@freezed
class FoodSaveUiState with _$FoodSaveUiState {
  const factory FoodSaveUiState({
    String? id,
    @Default('') String name,
    @Default('') String description,
    List<NutritionFacts>? nutritionFacts,
  }) = _FoodSaveUiState;
}
