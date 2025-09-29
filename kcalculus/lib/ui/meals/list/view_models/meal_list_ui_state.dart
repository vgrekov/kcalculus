import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';

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
