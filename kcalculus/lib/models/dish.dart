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
  final Map<Measure, NutritionRatio> nutritionRatios;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  Dish({
    String? id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.nutritionRatios,
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
    return nutritionRatios.values.map(nutrientData.toFacts).toList();
  }
}
