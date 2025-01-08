import 'package:flutter/material.dart';
import 'package:kcalculus/models/dish.dart';

enum IngredientsStepStateValidationResult {
  ingredientsMissing,
}

class DishWizardIngredientsStepState with ChangeNotifier {
  List<Ingredient> ingredients;

  bool _hasChanges;

  DishWizardIngredientsStepState({
    List<Ingredient>? ingredients,
  })  : ingredients = ingredients ?? [],
        _hasChanges = false;

  factory DishWizardIngredientsStepState.fromDish(Dish cleanCopy) {
    return DishWizardIngredientsStepState(
      ingredients: cleanCopy.ingredients,
    );
  }

  void addIngredient(Ingredient ingredient) {
    ingredients.add(ingredient);
    notifyListeners();

    _hasChanges = true;
  }

  void replaceIngredientAt(int index, Ingredient ingredient) {
    ingredients[index] = ingredient;
    notifyListeners();

    _hasChanges = true;
  }

  bool deleteIngredientAt(int index) {
    ingredients.removeAt(index);
    notifyListeners();

    _hasChanges = true;

    return true;
  }

  IngredientsStepStateValidationResult? validate() {
    if (ingredients.isEmpty) {
      return IngredientsStepStateValidationResult.ingredientsMissing;
    }

    return null;
  }

  bool get hasChanges => _hasChanges;
}
