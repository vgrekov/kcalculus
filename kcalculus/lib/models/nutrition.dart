import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';

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
    final factor = (otherAmount.unit.factor / amount.unit.factor) *
        (otherAmount.value / amount.value);
    return NutritionFacts(
      amount: amount,
      nutrientData: nutrientData * factor,
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

mixin Nutritious {
  Edible get edible;
  Amount get amount;

  NutrientData? getNutrientData() {
    final nutritionFacts = edible.getNutritionFacts();
    final sameMeasureNF = nutritionFacts
        .where((nf) => nf.amount.unit.measure == amount.unit.measure)
        .firstOrNull;
    if (sameMeasureNF != null) {
      return sameMeasureNF.convertTo(amount).nutrientData;
    }

    return null;
  }
}
