import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

part 'food_view_ui_state.freezed.dart';

@freezed
sealed class FoodViewUiState with _$FoodViewUiState {
  const factory FoodViewUiState({
    required Food food,
    required List<Nutrient> nutrientDefaults,
  }) = _FoodViewUiState;
}
