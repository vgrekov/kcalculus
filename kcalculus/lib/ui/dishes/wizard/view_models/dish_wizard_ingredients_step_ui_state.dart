import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';

part 'dish_wizard_ingredients_step_ui_state.freezed.dart';

enum IngredientsStepValidationResult {
  ingredientsMissing,
}

@freezed
sealed class DishWizardIngredientsStepUiState
    with _$DishWizardIngredientsStepUiState {
  const DishWizardIngredientsStepUiState._();

  const factory DishWizardIngredientsStepUiState({
    @Default([]) List<Ingredient> ingredients,
  }) = _DishWizardIngredientsStepUiState;

  factory DishWizardIngredientsStepUiState.fromDish(Dish dish) {
    return DishWizardIngredientsStepUiState(
      ingredients: [...dish.ingredients],
    );
  }

  IngredientsStepValidationResult? validate() {
    if (ingredients.isEmpty) {
      return IngredientsStepValidationResult.ingredientsMissing;
    }

    return null;
  }
}
