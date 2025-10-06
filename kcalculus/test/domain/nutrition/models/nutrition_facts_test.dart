import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';

void main() {
  group(
    'NutritionFacts.convertTo',
    () {
      late NutritionFacts nutritionFacts;

      setUp(() {
        nutritionFacts = NutritionFacts(
          amount: Amount(unit: Unit.gram, value: 100),
          nutrientData: NutrientData(
            nutrientAmounts: [
              NutrientAmount(
                nutrient: Nutrient.energy,
                amount: Amount(
                  unit: Unit.calorie,
                  value: 100,
                ),
              ),
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(
                  unit: Unit.gram,
                  value: 4,
                ),
              ),
              NutrientAmount(
                nutrient: Nutrient.totalCarbs,
                amount: Amount(
                  unit: Unit.gram,
                  value: 10,
                ),
              ),
              NutrientAmount(
                nutrient: Nutrient.fiber,
                amount: Amount(
                  unit: Unit.gram,
                  value: 1,
                ),
              ),
              NutrientAmount(
                nutrient: Nutrient.protein,
                amount: Amount(
                  unit: Unit.gram,
                  value: 9,
                ),
              ),
            ],
          ),
        );
      });

      test(
        'Measure mismatch',
        () {
          final otherAmount = Amount(unit: Unit.millilitre, value: 100);

          expect(
            () {
              nutritionFacts.convertTo(otherAmount);
            },
            throwsA('Per amount and other amount must be of the same measure.'),
          );
        },
      );

      test(
        'Unit match x2',
        () {
          final otherAmount = Amount(unit: Unit.gram, value: 200);

          expect(
            nutritionFacts.convertTo(otherAmount),
            NutritionFacts(
              amount: Amount(unit: Unit.gram, value: 200),
              nutrientData: NutrientData(
                nutrientAmounts: [
                  NutrientAmount(
                    nutrient: Nutrient.energy,
                    amount: Amount(
                      unit: Unit.calorie,
                      value: 200,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.fat,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 8,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.totalCarbs,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 20,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.fiber,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 2,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.protein,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

      test(
        'Unit match 1/2',
        () {
          final otherAmount = Amount(unit: Unit.gram, value: 50);

          expect(
            nutritionFacts.convertTo(otherAmount),
            NutritionFacts(
              amount: Amount(unit: Unit.gram, value: 50),
              nutrientData: NutrientData(
                nutrientAmounts: [
                  NutrientAmount(
                    nutrient: Nutrient.energy,
                    amount: Amount(
                      unit: Unit.calorie,
                      value: 50,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.fat,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 2,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.totalCarbs,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 5,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.fiber,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 0.5,
                    ),
                  ),
                  NutrientAmount(
                    nutrient: Nutrient.protein,
                    amount: Amount(
                      unit: Unit.gram,
                      value: 4.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

      test(
        'Measure system match',
        () {
          final otherAmount = Amount(unit: Unit.milligram, value: 100000);

          expect(
            nutritionFacts.convertTo(otherAmount),
            NutritionFacts(
              amount: otherAmount,
              nutrientData: nutritionFacts.nutrientData,
            ),
          );
        },
      );
    },
  );
}
