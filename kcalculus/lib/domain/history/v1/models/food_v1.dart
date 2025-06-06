import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/history/v1/models/nutrition/nutrition_facts_v1.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'food_v1.freezed.dart';
part 'food_v1.g.dart';

@freezed
class FoodV1 with _$FoodV1 {
  static const kVersion = 1;

  const FoodV1._();

  const factory FoodV1({
    String? id,
    required String name,
    required String description,
    required List<NutritionFactsV1> nutritionFacts,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FoodV1;

  factory FoodV1.fromJson(Map<String, dynamic> json) => _$FoodV1FromJson(json);

  Food toFood() {
    return Food(
      name: name,
      description: description,
      nutritionFacts: nutritionFacts
          .map(
            (nf) => NutritionFacts(
              amount: nf.amount,
              nutrientData: NutrientData(
                nutrientAmounts: [
                  NutrientAmount(
                    nutrient: Nutrient.energy,
                    amount: Amount(
                      unit: Unit.calorie,
                      value: nf.nutrientData.calories,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.fat,
                    amount: Amount(
                      unit: Unit.gram,
                      value: nf.nutrientData.fatInGrams,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.totalCarbs,
                    amount: Amount(
                      unit: Unit.gram,
                      value: nf.nutrientData.carbsInGrams,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.fiber,
                    amount: Amount(
                      unit: Unit.gram,
                      value: nf.nutrientData.fiberInGrams,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.protein,
                    amount: Amount(
                      unit: Unit.gram,
                      value: nf.nutrientData.proteinInGrams,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
