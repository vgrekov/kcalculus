import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';

class IngredientAmountChange {
  const IngredientAmountChange({
    required this.edible,
    required this.from,
    required this.to,
  });

  final Edible edible;

  final Amount from;

  final Amount to;
}

mixin DishWizardIngredientsStepViewModel {
  DishWizardUiState get state;

  set state(DishWizardUiState state);

  void onUserInteractionChange();

  IngredientAmountChange? addIngredient(Ingredient ingredient) =>
      _mergeIngredient(ingredient);

  IngredientAmountChange? replaceIngredientAt(
    int index,
    Ingredient ingredient,
  ) => _mergeIngredient(ingredient, index);

  IngredientAmountChange? _mergeIngredient(
    Ingredient ingredient, [
    int? index,
  ]) {
    IngredientAmountChange? result;

    final mergedIngredients = [...state.ingredientsStepState.ingredients];

    final sameEdibleIngredientIndex = mergedIngredients.indexWhere(
      (i) => i.edible == ingredient.edible,
    );

    if (sameEdibleIngredientIndex == -1 || sameEdibleIngredientIndex == index) {
      if (index == null) {
        mergedIngredients.add(ingredient);
      } else {
        mergedIngredients[index] = ingredient;
      }
    } else {
      final existing = mergedIngredients[sameEdibleIngredientIndex];

      final merged = existing.copyWith(
        amount: existing.add(ingredient.amount),
      );

      mergedIngredients[sameEdibleIngredientIndex] = merged;

      if (index != null) {
        mergedIngredients.removeAt(index);
      }

      result = IngredientAmountChange(
        edible: ingredient.edible,
        from: existing.amount,
        to: merged.amount,
      );
    }

    state = state.copyWith.ingredientsStepState(
      ingredients: mergedIngredients,
      ingredientsPrev: state.ingredientsStepState.ingredients,
    );

    onUserInteractionChange();

    return result;
  }

  bool deleteIngredientAt(int index) {
    state = state.copyWith.ingredientsStepState(
      ingredients: [
        ...state.ingredientsStepState.ingredients,
      ]..removeAt(index),
      ingredientsPrev: state.ingredientsStepState.ingredients,
    );

    onUserInteractionChange();

    return true;
  }

  void undoPreviousAction() {
    state = state.copyWith.ingredientsStepState(
      ingredients: state.ingredientsStepState.ingredientsPrev,
      ingredientsPrev: const [],
    );

    onUserInteractionChange();
  }
}
