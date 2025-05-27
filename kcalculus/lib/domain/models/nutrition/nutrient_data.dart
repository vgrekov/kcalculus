import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/macro_split.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_ratio.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'nutrient_data.freezed.dart';
part 'nutrient_data.g.dart';

const _kFatCaloriesPerGram = 9;
const _kCarbsCaloriesPerGram = 4;
const _kProteinCaloriesPerGram = 4;

@freezed
class NutrientData with _$NutrientData {
  const NutrientData._();

  const factory NutrientData({
    required Map<Nutrient, Amount> nutrientAmounts,
  }) = _NutrientData;

  factory NutrientData.empty() {
    return const NutrientData(nutrientAmounts: {});
  }

  factory NutrientData.fromJson(Map<String, dynamic> json) =>
      _$NutrientDataFromJson(json);

  double get calories => _nutrientValue(Nutrient.energy, Unit.calorie);

  double get fatInGrams => _nutrientValue(Nutrient.fat, Unit.gram);

  double get carbsInGrams => _nutrientValue(Nutrient.totalCarbs, Unit.gram);

  double get fiberInGrams => _nutrientValue(Nutrient.fiber, Unit.gram);

  double get proteinInGrams => _nutrientValue(Nutrient.protein, Unit.gram);

  double _nutrientValue(Nutrient nutrient, Unit unit) {
    return nutrientAmounts[nutrient]?.tryConvert(unit)?.value ?? 0;
  }

  NutrientData operator +(NutrientData other) {
    final nutrientAmountsSum = <Nutrient, Amount>{};
    for (final nutrient in Nutrient.values) {
      final amount = nutrientAmounts[nutrient];
      final otherAmount = other.nutrientAmounts[nutrient];

      Amount? result;
      if (amount != null && otherAmount != null) {
        result = amount + otherAmount;
      } else if (amount != null) {
        result = amount;
      } else if (otherAmount != null) {
        result = otherAmount;
      }

      result = result?.tryConvert(nutrient.defaultUnit);

      if (result != null) {
        nutrientAmountsSum[nutrient] = result;
      }
    }

    return NutrientData(
      nutrientAmounts: nutrientAmountsSum,
    );
  }

  NutrientData operator *(double factor) {
    return NutrientData(
      nutrientAmounts: nutrientAmounts.map((n, a) => MapEntry(n, a * factor)),
    );
  }

  MacroSplit? getMacroSplit() {
    final fatCalories = fatInGrams * _kFatCaloriesPerGram;
    // Fiber has no caloric value!
    final carbsCalories =
        (carbsInGrams - fiberInGrams) * _kCarbsCaloriesPerGram;
    final proteinCalories = proteinInGrams * _kProteinCaloriesPerGram;
    final estimatedCalories = fatCalories + carbsCalories + proteinCalories;
    if (estimatedCalories > 0) {
      return MacroSplit(
        fat: fatCalories / estimatedCalories,
        carbs: carbsCalories / estimatedCalories,
        protein: proteinCalories / estimatedCalories,
      );
    }

    return null;
  }

  NutrientData withPrecision(int fractionDigits, [bool round = true]) {
    return NutrientData(
      nutrientAmounts: nutrientAmounts.map(
        (n, a) => MapEntry(n, a.withPrecision(fractionDigits, round)),
      ),
    );
  }

  NutritionFacts toFacts(NutritionRatio ratio) {
    final factor = (ratio.perAmount.value * ratio.perAmount.unit.factor) /
        (ratio.totalAmount.value * ratio.totalAmount.unit.factor);
    return NutritionFacts(
      amount: ratio.perAmount,
      nutrientData: (this * factor).withPrecision(2),
    );
  }
}
