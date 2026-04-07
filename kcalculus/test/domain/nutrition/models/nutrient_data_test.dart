import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';

void main() {
  group(
    'NutrientData.+',
    () {
      test(
        'With calculation',
        () {
          final nd1 = NutrientData(
            nutrientAmounts: [
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(unit: Unit.gram, value: 9),
              ),
              NutrientAmount(
                nutrient: Nutrient.saturatedFat,
                amount: Amount(unit: Unit.gram, value: 2),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega3Fat,
                amount: Amount(unit: Unit.milligram, value: 0.1),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega6Fat,
                amount: Amount(unit: Unit.milligram, value: 1),
              ),
              NutrientAmount(
                nutrient: Nutrient.monounsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 6),
              ),
              NutrientAmount(
                nutrient: Nutrient.polyunsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 1),
              ),
            ],
          );

          final nd2 = NutrientData(
            nutrientAmounts: [
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(unit: Unit.gram, value: 9.96),
              ),
              NutrientAmount(
                nutrient: Nutrient.saturatedFat,
                amount: Amount(unit: Unit.gram, value: 3.2),
              ),
              NutrientAmount(
                nutrient: Nutrient.unsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 5.45),
              ),
              NutrientAmount(
                nutrient: Nutrient.monounsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 3.63),
              ),
              NutrientAmount(
                nutrient: Nutrient.polyunsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 1.82),
              ),
            ],
          );

          final sum = nd1 + nd2;

          final expected = NutrientData(
            nutrientAmounts: [
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(unit: Unit.gram, value: 9 + 9.96),
              ),
              NutrientAmount(
                nutrient: Nutrient.saturatedFat,
                amount: Amount(unit: Unit.gram, value: 2 + 3.2),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega3Fat,
                amount: Amount(unit: Unit.milligram, value: 0.1),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega6Fat,
                amount: Amount(unit: Unit.milligram, value: 1),
              ),
              NutrientAmount(
                nutrient: Nutrient.monounsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 6 + 3.63),
              ),
              NutrientAmount(
                nutrient: Nutrient.polyunsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 1 + 1.82),
              ),
              NutrientAmount(
                nutrient: Nutrient.unsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 7.0011 + 5.45),
              ),
            ],
          );

          expect(sum, equals(expected));
        },
      );

      test(
        'Without calculation',
        () {
          final nd1 = NutrientData(
            nutrientAmounts: [
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(unit: Unit.gram, value: 9),
              ),
              NutrientAmount(
                nutrient: Nutrient.saturatedFat,
                amount: Amount(unit: Unit.gram, value: 2),
              ),
              NutrientAmount(
                nutrient: Nutrient.unsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 8),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega3Fat,
                amount: Amount(unit: Unit.milligram, value: 0.1),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega6Fat,
                amount: Amount(unit: Unit.milligram, value: 1),
              ),
              NutrientAmount(
                nutrient: Nutrient.monounsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 6),
              ),
              NutrientAmount(
                nutrient: Nutrient.polyunsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 1),
              ),
            ],
          );

          final nd2 = NutrientData(
            nutrientAmounts: [
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(unit: Unit.gram, value: 9.96),
              ),
              NutrientAmount(
                nutrient: Nutrient.saturatedFat,
                amount: Amount(unit: Unit.gram, value: 3.2),
              ),
              NutrientAmount(
                nutrient: Nutrient.unsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 5.45),
              ),
              NutrientAmount(
                nutrient: Nutrient.monounsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 3.63),
              ),
              NutrientAmount(
                nutrient: Nutrient.polyunsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 1.82),
              ),
            ],
          );

          final sum = nd1 + nd2;

          final expected = NutrientData(
            nutrientAmounts: [
              NutrientAmount(
                nutrient: Nutrient.fat,
                amount: Amount(unit: Unit.gram, value: 9 + 9.96),
              ),
              NutrientAmount(
                nutrient: Nutrient.saturatedFat,
                amount: Amount(unit: Unit.gram, value: 2 + 3.2),
              ),
              NutrientAmount(
                nutrient: Nutrient.unsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 8 + 5.45),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega3Fat,
                amount: Amount(unit: Unit.milligram, value: 0.1),
              ),
              NutrientAmount(
                nutrient: Nutrient.omega6Fat,
                amount: Amount(unit: Unit.milligram, value: 1),
              ),
              NutrientAmount(
                nutrient: Nutrient.monounsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 6 + 3.63),
              ),
              NutrientAmount(
                nutrient: Nutrient.polyunsaturatedFat,
                amount: Amount(unit: Unit.gram, value: 1 + 1.82),
              ),
            ],
          );

          expect(sum, equals(expected));
        },
      );
    },
  );
}
