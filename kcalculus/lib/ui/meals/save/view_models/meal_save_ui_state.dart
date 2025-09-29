import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/edible/models/portion.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';

part 'meal_save_ui_state.freezed.dart';

@freezed
sealed class MealSaveUiState with _$MealSaveUiState {
  const MealSaveUiState._();

  const factory MealSaveUiState._default({
    String? id,
    required DateTime eatenAt,
    Portion? portion,
  }) = _MealSaveUiState;

  factory MealSaveUiState({
    String? id,
    DateTime? eatenAt,
    Portion? portion,
  }) =>
      MealSaveUiState._default(
        id: id,
        eatenAt: eatenAt ?? DateTime.now(),
        portion: portion,
      );

  factory MealSaveUiState.fromMeal(Meal meal) {
    return MealSaveUiState._default(
      id: meal.id,
      eatenAt: meal.eatenAt,
      portion: meal,
    );
  }

  Meal toMeal() {
    return Meal(
      id: id,
      edible: portion!.edible,
      amount: portion!.amount,
      eatenAt: eatenAt,
    );
  }
}
