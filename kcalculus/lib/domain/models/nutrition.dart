import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/double_ext.dart';

const fatCaloriesPerGram = 9;
const carbsCaloriesPerGram = 4;
const proteinCaloriesPerGram = 4;

class MacroSplit {
  late double _fatPercentage;
  late double _carbsPercentage;
  late double _proteinPercentage;

  MacroSplit({
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

    _fatPercentage = fractions[0];
    _carbsPercentage = fractions[1];
    _proteinPercentage = fractions[2];
  }

  double get fatPercentage {
    return _fatPercentage;
  }

  double get carbsPercentage {
    return _carbsPercentage;
  }

  double get proteinPercentage {
    return _proteinPercentage;
  }
}

class NutrientData {
  final double calories;
  final double fatInGrams;
  final double carbsInGrams;
  final double fiberInGrams;
  final double proteinInGrams;

  const NutrientData({
    required this.calories,
    required this.fatInGrams,
    required this.carbsInGrams,
    required this.fiberInGrams,
    required this.proteinInGrams,
  });

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
    final fatCalories = fatInGrams * fatCaloriesPerGram;
    // Fiber has no caloric value!
    final carbsCalories = (carbsInGrams - fiberInGrams) * carbsCaloriesPerGram;
    final proteinCalories = proteinInGrams * proteinCaloriesPerGram;
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

  @override
  int get hashCode {
    return Object.hash(
      calories,
      fatInGrams,
      carbsInGrams,
      fiberInGrams,
      proteinInGrams,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NutrientData &&
        other.calories == calories &&
        other.fatInGrams == fatInGrams &&
        other.carbsInGrams == carbsInGrams &&
        other.fiberInGrams == fiberInGrams &&
        other.proteinInGrams == proteinInGrams;
  }
}

class NutritionFacts {
  final Amount amount;
  final NutrientData nutrientData;

  NutritionFacts({
    required this.amount,
    required this.nutrientData,
  });

  NutritionFacts convertTo(Amount otherAmount) {
    if (amount.unit.measure != otherAmount.unit.measure) {
      throw 'Per amount and other amount must be of the same measure.';
    }

    final factor = (otherAmount.unit.factor / amount.unit.factor) *
        (otherAmount.value / amount.value);
    return NutritionFacts(
      amount: amount,
      nutrientData: nutrientData * factor,
    );
  }

  Amount convertAmount(
    Amount amount, {
    required NutritionFacts targetNutritionFacts,
  }) {
    if (this.amount.unit.measure != amount.unit.measure) {
      throw 'Per amount and given amount must be of the same measure.';
    }

    final calories = nutrientData.calories *
        (amount.unit.factor / this.amount.unit.factor) *
        (amount.value / this.amount.value);

    return Amount(
      unit: targetNutritionFacts.amount.unit,
      value: calories /
          targetNutritionFacts.nutrientData.calories *
          targetNutritionFacts.amount.value,
    );
  }

  @override
  int get hashCode {
    return Object.hash(
      amount,
      nutrientData,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NutritionFacts &&
        other.amount == amount &&
        other.nutrientData == nutrientData;
  }
}

class NutritionRatio {
  final Amount perAmount;
  final Amount totalAmount;

  NutritionRatio({
    required this.perAmount,
    required this.totalAmount,
  }) {
    if (perAmount.unit.measure != totalAmount.unit.measure) {
      throw 'Both perAmount and totalAmount must be of the same measure.';
    }
  }
}

class Portion {
  final Edible edible;
  final Amount amount;

  const Portion({
    required this.edible,
    required this.amount,
  });

  NutrientData? getNutrientData() {
    NutritionFacts? closestNF;

    for (final nf in edible.getNutritionFacts()) {
      if (nf.amount.unit == amount.unit) {
        // Nice, we found an exact match!
        closestNF = nf;
        break;
      }

      // Must be of the same measure
      // and, preferably, of the same system
      if (nf.amount.unit.measure == amount.unit.measure &&
          (closestNF == null ||
              (closestNF.amount.unit.system != amount.unit.system &&
                  nf.amount.unit.system == amount.unit.system))) {
        closestNF = nf;
      }
    }

    if (closestNF != null) {
      return closestNF.convertTo(amount).nutrientData;
    }

    return null;
  }
}
