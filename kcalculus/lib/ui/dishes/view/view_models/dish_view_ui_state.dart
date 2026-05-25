import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

part 'dish_view_ui_state.freezed.dart';

@freezed
sealed class DishViewUiState with _$DishViewUiState {
  const factory DishViewUiState({
    required Dish dish,
    required List<Nutrient> nutrientDefaults,
  }) = _DishViewUiState;
}
