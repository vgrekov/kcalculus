import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_ratio.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/string_ext.dart';

part 'dish.freezed.dart';
part 'dish.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
class Dish with _$Dish implements Edible {
  const Dish._();

  const factory Dish({
    String? id,
    required String name,
    required String description,
    required List<Ingredient> ingredients,
    required Map<Measure, NutritionRatio> nutritionRatios,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Dish;

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

  Dish copy() {
    return Dish(
      name: name.nextVersion(),
      description: description,
      ingredients: ingredients,
      nutritionRatios: nutritionRatios,
    );
  }

  Food toFood() {
    return Food(
      name: name,
      description: description,
      nutritionFacts: getNutritionFacts(),
    );
  }
}
