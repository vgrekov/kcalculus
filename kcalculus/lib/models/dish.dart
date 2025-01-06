import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/identifiable.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';

class Ingredient extends Portion {
  Ingredient({
    required super.edible,
    required super.amount,
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
          massNF.amount.value *
          massNF.amount.unit.factor /
          Unit.gram.factor;
    }

    return null;
  }

  Ingredient copyWith({
    Edible? edible,
    Amount? amount,
  }) {
    return Ingredient(
      edible: edible ?? this.edible,
      amount: amount ?? this.amount,
    );
  }
}

class Dish with Identifiable implements Edible {
  @override
  final String name;
  @override
  final String description;
  final List<Ingredient> ingredients;
  final double weightInGrams;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  Dish({
    String? id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.weightInGrams,
    this.createdAt,
    this.updatedAt,
  }) {
    this.id = id;
  }

  @override
  List<NutritionFacts> getNutritionFacts() {
    final nutrientData = ingredients
        .map((i) => i.getNutrientData() ?? NutrientData.empty())
        .fold(
          NutrientData.empty(),
          (nd1, nd2) => nd1 + nd2,
        );
    return [
      NutritionFacts(
        amount: Amount(unit: Unit.gram, value: 100),
        nutrientData: (nutrientData * (100 / weightInGrams)).withPrecision(2),
      ),
    ];
  }
}
