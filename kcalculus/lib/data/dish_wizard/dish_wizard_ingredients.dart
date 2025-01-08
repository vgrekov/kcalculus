import 'package:flutter/material.dart';
import 'package:kcalculus/models/dish.dart';

enum IngredientsStepStateValidationResult {
  ingredientsMissing,
}

class DishWizardIngredientsStepState with ChangeNotifier {
  List<Ingredient> ingredients;

  DishWizardIngredientsStepState({
    List<Ingredient>? ingredients,
  }) : ingredients = ingredients ?? [];

  factory DishWizardIngredientsStepState.fromDish(Dish cleanCopy) {
    return DishWizardIngredientsStepState(
      ingredients: cleanCopy.ingredients,
    );
  }

  void addIngredient(Ingredient ingredient) {
    ingredients.add(ingredient);
    notifyListeners();
  }

  void replaceIngredientAt(int index, Ingredient ingredient) {
    ingredients[index] = ingredient;
    notifyListeners();
  }

  bool deleteIngredientAt(int index) {
    ingredients.removeAt(index);
    notifyListeners();
    return true;
  }

  IngredientsStepStateValidationResult? validate() {
    if (ingredients.isEmpty) {
      return IngredientsStepStateValidationResult.ingredientsMissing;
    }

    return null;
  }
}
