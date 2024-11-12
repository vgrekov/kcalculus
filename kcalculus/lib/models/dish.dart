import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/identifiable.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';

class Ingredient with Nutritious {
  @override
  final Edible edible;
  @override
  final Amount amount;

  Ingredient({
    required this.edible,
    required this.amount,
  });

  double? getWeightInGrams() {
    final nutritionFacts = edible.getNutritionFacts();
    final sameMeasureNF = nutritionFacts
        .where((nf) => nf.amount.unit.measure == amount.unit.measure)
        .firstOrNull;
    final massNF = nutritionFacts
        .where((nf) => nf.amount.unit.measure == Measure.mass)
        .firstOrNull;
    if (sameMeasureNF != null && massNF != null) {
      final calories = sameMeasureNF.nutrientData.calories *
          (amount.unit.factor / sameMeasureNF.amount.unit.factor) *
          (amount.value / sameMeasureNF.amount.value);
      return calories /
          massNF.nutrientData.calories *
          massNF.amount.unit.factor /
          massNF.amount.value;
    }

    return null;
  }
}

class Dish with Identifiable implements Edible {
  @override
  final String name;
  @override
  final String? description;
  late List<Ingredient> ingredients;
  double? _weightInGrams;

  Dish({
    String? id,
    required this.name,
    this.description,
    ingredients,
    weightInGrams,
  }) {
    this.id = id;
    this.ingredients = ingredients ?? [];
    _weightInGrams = weightInGrams;
  }

  void addIngredient(Ingredient ingredient) {
    ingredients.add(ingredient);

    if (_weightInGrams != null) {
      _weightInGrams = _weightInGrams! + (ingredient.getWeightInGrams() ?? 0);
    }
  }

  void removeIngredient(int index) {
    Ingredient ingredient = ingredients.removeAt(index);

    if (_weightInGrams != null) {
      _weightInGrams = _weightInGrams! - (ingredient.getWeightInGrams() ?? 0);
    }
  }

  @override
  List<NutritionFacts> getNutritionFacts() {
    final weight = getWeightInGrams();
    final nutrientData = ingredients
        .map((i) => i.getNutrientData() ?? NutrientData.empty())
        .reduce((nd1, nd2) => nd1 + nd2);
    return [
      NutritionFacts(
        amount: Amount(unit: Unit.gram, value: 100),
        nutrientData: nutrientData * (100 / weight),
      ),
    ];
  }

  double getWeightInGrams() {
    return _weightInGrams ??
        ingredients
            .map((i) => i.getWeightInGrams() ?? 0)
            .reduce((w1, w2) => w1 + w2);
  }

  void setWeightInGrams(double value) {
    _weightInGrams = value;
  }

  void resetWeight() {
    _weightInGrams = null;
  }
}
