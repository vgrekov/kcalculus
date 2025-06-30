import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/repositories/usda/usda_food_converter.dart';
import 'package:kcalculus/data/services/usda/food/usda_food_dto_converter.dart';
import 'package:kcalculus/data/services/usda/food/usda_food_dto_model.dart';
import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_dto_converter.dart';
import 'package:kcalculus/data/services/usda/portion/usda_portion_dto_converter.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/units.dart';

import '../../../utils.dart';

void main() {
  group(
    'UsdaFoodConverter - toModel',
    () {
      late UsdaFoodConverter usdaFoodConverter;
      late UsdaFoodDtoConverter foodDtoConverter;
      late UsdaPortionDtoConverter portionDtoConverter;
      late UsdaNutrientDtoConverter nutrientDtoConverter;

      setUp(() {
        usdaFoodConverter = UsdaFoodConverter();
        foodDtoConverter = UsdaFoodDtoConverter();
        portionDtoConverter = UsdaPortionDtoConverter();
        nutrientDtoConverter = UsdaNutrientDtoConverter();
      });

      test(
        'Eggs, Grade A, Large, egg whole',
        () async {
          final modelJson = await loadFixture(
            'test/data/repositories/usda/fixtures/egg.json',
          );

          final dtoModel = UsdaFoodDtoModel.fromJson(jsonDecode(modelJson));

          final model = usdaFoodConverter.toModel(
            foodDtoConverter.toDbModel(dtoModel),
            dtoModel.portions
                    ?.map((portion) =>
                        portionDtoConverter.toDbModel(portion, dtoModel.fdcId))
                    .toList() ??
                const [],
            dtoModel.nutrients
                .map((nutrient) =>
                    nutrientDtoConverter.toDbModel(nutrient, dtoModel.fdcId))
                .toList(),
          );

          expect(model.name, 'Eggs');
          expect(model.description, 'Grade A, Large, egg whole');

          expect(
            model.getNutritionFacts().map((nf) => nf.amount).toList(),
            [
              Amount(unit: Unit.gram, value: 100),
              Amount(unit: Unit.piece, value: 1),
            ],
          );

          expect(
            model.nutritionFacts[0].nutrientData.nutrientAmounts,
            unorderedEquals(
              [
                NutrientAmount(
                  nutrient: Nutrient.energy,
                  amount: Amount(unit: Unit.calorie, value: 148),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB1,
                  amount: Amount(unit: Unit.milligram, value: 0.08),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB2,
                  amount: Amount(unit: Unit.milligram, value: 0.42),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB12,
                  amount: Amount(unit: Unit.microgram, value: 1.02),
                ),
                NutrientAmount(
                  nutrient: Nutrient.cholesterol,
                  amount: Amount(unit: Unit.milligram, value: 411),
                ),
                NutrientAmount(
                  nutrient: Nutrient.saturatedFat,
                  amount: Amount(unit: Unit.gram, value: 3.20),
                ),
                NutrientAmount(
                  nutrient: Nutrient.protein,
                  amount: Amount(unit: Unit.gram, value: 12.4),
                ),
                NutrientAmount(
                  nutrient: Nutrient.iron,
                  amount: Amount(unit: Unit.milligram, value: 1.67),
                ),
                NutrientAmount(
                  nutrient: Nutrient.magnesium,
                  amount: Amount(unit: Unit.milligram, value: 11.4),
                ),
                NutrientAmount(
                  nutrient: Nutrient.phosphorus,
                  amount: Amount(unit: Unit.milligram, value: 184),
                ),
                NutrientAmount(
                  nutrient: Nutrient.sodium,
                  amount: Amount(unit: Unit.milligram, value: 129),
                ),
                NutrientAmount(
                  nutrient: Nutrient.copper,
                  amount: Amount(unit: Unit.milligram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.manganese,
                  amount: Amount(unit: Unit.milligram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.betaCarotene,
                  amount: Amount(unit: Unit.microgram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.selenium,
                  amount: Amount(unit: Unit.microgram, value: 31.1),
                ),
                NutrientAmount(
                  nutrient: Nutrient.calcium,
                  amount: Amount(unit: Unit.milligram, value: 48.0),
                ),
                NutrientAmount(
                  nutrient: Nutrient.potassium,
                  amount: Amount(unit: Unit.milligram, value: 132),
                ),
                NutrientAmount(
                  nutrient: Nutrient.zinc,
                  amount: Amount(unit: Unit.milligram, value: 1.24),
                ),
                NutrientAmount(
                  nutrient: Nutrient.fat,
                  amount: Amount(unit: Unit.gram, value: 9.96),
                ),
                NutrientAmount(
                  nutrient: Nutrient.monounsaturatedFat,
                  amount: Amount(unit: Unit.gram, value: 3.63),
                ),
                NutrientAmount(
                  nutrient: Nutrient.polyunsaturatedFat,
                  amount: Amount(unit: Unit.gram, value: 1.82),
                ),
                NutrientAmount(
                  nutrient: Nutrient.unsaturatedFat,
                  amount: Amount(unit: Unit.gram, value: 5.45),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB3,
                  amount: Amount(unit: Unit.milligram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB6,
                  amount: Amount(unit: Unit.milligram, value: 0.06),
                ),
                NutrientAmount(
                  nutrient: Nutrient.totalCarbs,
                  amount: Amount(unit: Unit.gram, value: 0.96),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminD,
                  amount: Amount(unit: Unit.microgram, value: 2.46),
                ),
                NutrientAmount(
                  nutrient: Nutrient.sugar,
                  amount: Amount(unit: Unit.gram, value: 0.20),
                ),
                NutrientAmount(
                  nutrient: Nutrient.iodine,
                  amount: Amount(unit: Unit.microgram, value: 49.1),
                ),
                NutrientAmount(
                  nutrient: Nutrient.fiber,
                  amount: Amount(unit: Unit.gram, value: 0.00),
                ),
              ],
            ),
          );

          expect(
            model.nutritionFacts[1].nutrientData.nutrientAmounts,
            unorderedEquals(
              [
                NutrientAmount(
                  nutrient: Nutrient.energy,
                  amount: Amount(unit: Unit.calorie, value: 74.44),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB1,
                  amount: Amount(unit: Unit.milligram, value: 0.04),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB2,
                  amount: Amount(unit: Unit.milligram, value: 0.21),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB12,
                  amount: Amount(unit: Unit.microgram, value: 0.51),
                ),
                NutrientAmount(
                  nutrient: Nutrient.cholesterol,
                  amount: Amount(unit: Unit.milligram, value: 206.73),
                ),
                NutrientAmount(
                  nutrient: Nutrient.saturatedFat,
                  amount: Amount(unit: Unit.gram, value: 1.61),
                ),
                NutrientAmount(
                  nutrient: Nutrient.protein,
                  amount: Amount(unit: Unit.gram, value: 6.24),
                ),
                NutrientAmount(
                  nutrient: Nutrient.iron,
                  amount: Amount(unit: Unit.milligram, value: 0.84),
                ),
                NutrientAmount(
                  nutrient: Nutrient.magnesium,
                  amount: Amount(unit: Unit.milligram, value: 5.73),
                ),
                NutrientAmount(
                  nutrient: Nutrient.phosphorus,
                  amount: Amount(unit: Unit.milligram, value: 92.55),
                ),
                NutrientAmount(
                  nutrient: Nutrient.sodium,
                  amount: Amount(unit: Unit.milligram, value: 64.89),
                ),
                NutrientAmount(
                  nutrient: Nutrient.copper,
                  amount: Amount(unit: Unit.milligram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.manganese,
                  amount: Amount(unit: Unit.milligram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.betaCarotene,
                  amount: Amount(unit: Unit.microgram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.selenium,
                  amount: Amount(unit: Unit.microgram, value: 15.64),
                ),
                NutrientAmount(
                  nutrient: Nutrient.calcium,
                  amount: Amount(unit: Unit.milligram, value: 24.14),
                ),
                NutrientAmount(
                  nutrient: Nutrient.potassium,
                  amount: Amount(unit: Unit.milligram, value: 66.4),
                ),
                NutrientAmount(
                  nutrient: Nutrient.zinc,
                  amount: Amount(unit: Unit.milligram, value: 0.62),
                ),
                NutrientAmount(
                  nutrient: Nutrient.fat,
                  amount: Amount(unit: Unit.gram, value: 5.01),
                ),
                NutrientAmount(
                  nutrient: Nutrient.monounsaturatedFat,
                  amount: Amount(unit: Unit.gram, value: 1.83),
                ),
                NutrientAmount(
                  nutrient: Nutrient.polyunsaturatedFat,
                  amount: Amount(unit: Unit.gram, value: 0.92),
                ),
                NutrientAmount(
                  nutrient: Nutrient.unsaturatedFat,
                  amount: Amount(unit: Unit.gram, value: 2.74),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB3,
                  amount: Amount(unit: Unit.milligram, value: 0.00),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminB6,
                  amount: Amount(unit: Unit.milligram, value: 0.03),
                ),
                NutrientAmount(
                  nutrient: Nutrient.totalCarbs,
                  amount: Amount(unit: Unit.gram, value: 0.48),
                ),
                NutrientAmount(
                  nutrient: Nutrient.vitaminD,
                  amount: Amount(unit: Unit.microgram, value: 1.24),
                ),
                NutrientAmount(
                  nutrient: Nutrient.sugar,
                  amount: Amount(unit: Unit.gram, value: 0.10),
                ),
                NutrientAmount(
                  nutrient: Nutrient.iodine,
                  amount: Amount(unit: Unit.microgram, value: 24.7),
                ),
                NutrientAmount(
                  nutrient: Nutrient.fiber,
                  amount: Amount(unit: Unit.gram, value: 0.00),
                ),
              ],
            ),
          );
        },
      );

      test(
        'Cucumber, with peel, raw',
        () async {
          final modelJson = await loadFixture(
            'test/data/repositories/usda/fixtures/cucumber.json',
          );

          final dtoModel = UsdaFoodDtoModel.fromJson(jsonDecode(modelJson));

          final model = usdaFoodConverter.toModel(
            foodDtoConverter.toDbModel(dtoModel),
            dtoModel.portions
                    ?.map((portion) =>
                        portionDtoConverter.toDbModel(portion, dtoModel.fdcId))
                    .toList() ??
                const [],
            dtoModel.nutrients
                .map((nutrient) =>
                    nutrientDtoConverter.toDbModel(nutrient, dtoModel.fdcId))
                .toList(),
          );

          expect(model.name, 'Cucumber');
          expect(model.description, 'With peel, raw');

          expect(
            model.getNutritionFacts().map((nf) => nf.amount).toList(),
            [
              Amount(unit: Unit.gram, value: 100),
            ],
          );

          expect(
            model.nutritionFacts[0].nutrientData
                .nutrientAmountsMap[Nutrient.energy],
            Amount(unit: Unit.calorie, value: 13.9),
          );
        },
      );
    },
  );
}
