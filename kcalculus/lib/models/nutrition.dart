import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';

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
}

class NutritionFacts {
  final Amount amount;
  final NutrientData nutrientData;

  const NutritionFacts({
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
