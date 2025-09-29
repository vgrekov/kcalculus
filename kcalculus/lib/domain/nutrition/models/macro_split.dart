import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

part 'macro_split.freezed.dart';
part 'macro_split.g.dart';

@freezed
sealed class MacroSplit with _$MacroSplit {
  static MacroSplit? fromAmounts({
    required Amount? fat,
    required Amount? carbs,
    required Amount? protein,
    required Amount? fiber,
  }) {
    final fatInGrams = fat?.tryConvert(Unit.gram)?.value ?? 0;
    final carbsInGrams = carbs?.tryConvert(Unit.gram)?.value ?? 0;
    final fiberInGrams = fiber?.tryConvert(Unit.gram)?.value ?? 0;
    final proteinInGrams = protein?.tryConvert(Unit.gram)?.value ?? 0;

    final fatCalories = fatInGrams * kCaloriesPerGramOfFat;
    // Fiber has no caloric value!
    final carbsCalories =
        (carbsInGrams - fiberInGrams) * kCaloriesPerGramOfCarbs;
    final proteinCalories = proteinInGrams * kCaloriesPerGramOfProtein;
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

  const factory MacroSplit._default({
    required double fatPercentage,
    required double carbsPercentage,
    required double proteinPercentage,
  }) = _MacroSplit;

  factory MacroSplit({
    required double fat,
    required double carbs,
    required double protein,
  }) {
    if (carbs < 0 || protein < 0 || fat < 0) {
      throw 'Macronutrient fraction can not be a negative number.';
    }

    if (carbs == 0 && protein == 0 && fat == 0) {
      throw 'Macronutrient fractions can not all be a zero.';
    }

    var fractions = [fat, carbs, protein];

    final factor = 100 / (fat + carbs + protein);
    fractions = fractions.map((f) => f * factor).toList();

    final nonZeroCount = fractions.where((f) => f != 0).length;
    var nonZeroIndex = 0;
    var correctedSum = 0.0;
    for (var i = 0; i < fractions.length; i++) {
      var fraction = fractions[i];
      if (fraction != 0) {
        nonZeroIndex++;
        if (nonZeroIndex < nonZeroCount) {
          fraction = (fraction * 100).roundToDouble() / 100;
          correctedSum += fraction;
          fractions[i] = fraction;
        } else {
          fractions[i] = 100 - correctedSum;
          break;
        }
      }
    }

    return MacroSplit._default(
      fatPercentage: fractions[0],
      carbsPercentage: fractions[1],
      proteinPercentage: fractions[2],
    );
  }

  factory MacroSplit.fromJson(Map<String, dynamic> json) =>
      _$MacroSplitFromJson(json);
}
