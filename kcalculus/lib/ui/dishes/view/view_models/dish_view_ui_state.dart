import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

part 'dish_view_ui_state.freezed.dart';

@freezed
sealed class DishViewUiState with _$DishViewUiState {
  const factory DishViewUiState({
    required Dish dish,
    required List<Nutrient> nutrientDefaults,
  }) = _DishViewUiState;
}
