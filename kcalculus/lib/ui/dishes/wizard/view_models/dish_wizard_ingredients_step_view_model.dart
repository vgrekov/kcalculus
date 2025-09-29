import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';

mixin DishWizardIngredientsStepViewModel {
  DishWizardUiState get state;

  set state(DishWizardUiState state);

  void onUserInteractionChange();

  void addIngredient(Ingredient ingredient) {
    state = state.copyWith.ingredientsStepState(
      ingredients: [
        ...state.ingredientsStepState.ingredients,
        ingredient,
      ],
    );

    onUserInteractionChange();
  }

  void replaceIngredientAt(int index, Ingredient ingredient) {
    state = state.copyWith.ingredientsStepState(
      ingredients: state.ingredientsStepState.ingredients.indexed.map(
        (pair) {
          if (pair.$1 == index) {
            return ingredient;
          }

          return pair.$2;
        },
      ).toList(),
    );

    onUserInteractionChange();
  }

  bool deleteIngredientAt(int index) {
    state = state.copyWith.ingredientsStepState(
      ingredients: [
        ...state.ingredientsStepState.ingredients,
      ]..removeAt(index),
    );

    onUserInteractionChange();

    return true;
  }

  bool restoreIngredientAt(int index, Ingredient ingredient) {
    state = state.copyWith.ingredientsStepState(
      ingredients: [
        ...state.ingredientsStepState.ingredients,
      ]..insert(index, ingredient),
    );

    onUserInteractionChange();

    return true;
  }
}
