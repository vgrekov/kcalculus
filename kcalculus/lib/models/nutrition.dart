import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';

const fatCaloriesPerGram = 9;
const carbsCaloriesPerGram = 4;
const proteinCaloriesPerGram = 4;

class MacroSplit {
  final double fat;
  final double carbs;
  final double protein;

  MacroSplit({
    required this.fat,
    required this.carbs,
    required this.protein,
  }) {
    if (carbs < 0 || protein < 0 || fat < 0) {
      throw 'Macronutrient percentage can not be a negative number.';
    }

    final total = carbs + protein + fat;
    if (total != 1) {
      throw 'The split total must be equal to 1 (100%) but is $total.';
    }
  }

  double get fatPercentage {
    return (fat * 10000).roundToDouble() / 100;
  }

  double get carbsPercentage {
    return (carbs * 10000).roundToDouble() / 100;
  }

  double get proteinPercentage {
    return 100 - fatPercentage - carbsPercentage;
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
      final fat = fatCalories / estimatedCalories;
      final carbs = carbsCalories / estimatedCalories;
      return MacroSplit(
        fat: fat,
        carbs: carbs,
        protein: 1 - fat - carbs,
      );
    }

    return null;
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
