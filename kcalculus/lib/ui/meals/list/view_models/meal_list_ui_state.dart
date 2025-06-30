import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/meal.dart';

part 'meal_list_ui_state.freezed.dart';

@freezed
sealed class MealListUiState with _$MealListUiState {
  const factory MealListUiState({
    required DateTime date,
    required Future<List<Meal>> dataLoader,
    @Default([]) List<Meal> data,
    required bool showCalendar,
    Amount? energyGoalAmount,
  }) = _MealListUiState;
}
