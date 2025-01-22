import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/nutrition/macro_split.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_ratio.dart';
import 'package:kcalculus/utils/double_ext.dart';

part 'nutrient_data.freezed.dart';
part 'nutrient_data.g.dart';

const _kFatCaloriesPerGram = 9;
const _kCarbsCaloriesPerGram = 4;
const _kProteinCaloriesPerGram = 4;

@Freezed(
  fromJson: false,
  toJson: true,
)
class NutrientData with _$NutrientData {
  const NutrientData._();

  const factory NutrientData({
    required double calories,
    required double fatInGrams,
    required double carbsInGrams,
    required double fiberInGrams,
    required double proteinInGrams,
  }) = _NutrientData;

  factory NutrientData.empty() {
    return const NutrientData(
      calories: 0,
      fatInGrams: 0,
      carbsInGrams: 0,
      fiberInGrams: 0,
      proteinInGrams: 0,
    );
  }

  NutrientData operator +(NutrientData other) {
    return NutrientData(
      calories: calories + other.calories,
      fatInGrams: fatInGrams + other.fatInGrams,
      carbsInGrams: carbsInGrams + other.carbsInGrams,
      fiberInGrams: fiberInGrams + other.fiberInGrams,
      proteinInGrams: proteinInGrams + other.proteinInGrams,
    );
  }

  NutrientData operator *(double factor) {
    return NutrientData(
      calories: calories * factor,
      fatInGrams: fatInGrams * factor,
      carbsInGrams: carbsInGrams * factor,
      fiberInGrams: fiberInGrams * factor,
      proteinInGrams: proteinInGrams * factor,
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
      calories: calories.withPrecision(fractionDigits, round),
      fatInGrams: fatInGrams.withPrecision(fractionDigits, round),
      carbsInGrams: carbsInGrams.withPrecision(fractionDigits, round),
      fiberInGrams: fiberInGrams.withPrecision(fractionDigits, round),
      proteinInGrams: proteinInGrams.withPrecision(fractionDigits, round),
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
