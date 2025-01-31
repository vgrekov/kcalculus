import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';

mixin DishWizardIngredientsStepViewModel {
  DishWizardUiState get state;

  set state(DishWizardUiState state);

  void onUserInteractionChange();

  void addIngredient(Ingredient ingredient) {
    final ingredients = state.ingredientsStepState.ingredients;

    ingredients.add(ingredient);

    state = state.copyWith.ingredientsStepState(
      ingredients: ingredients,
    );

    onUserInteractionChange();
  }

  void replaceIngredientAt(int index, Ingredient ingredient) {
    final ingredients = state.ingredientsStepState.ingredients;

    ingredients[index] = ingredient;

    state = state.copyWith.ingredientsStepState(
      ingredients: ingredients,
    );

    onUserInteractionChange();
  }

  bool deleteIngredientAt(int index) {
    final ingredients = state.ingredientsStepState.ingredients;

    ingredients.removeAt(index);

    state = state.copyWith.ingredientsStepState(
      ingredients: ingredients,
    );

    onUserInteractionChange();

    return true;
  }
}
