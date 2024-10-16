import 'package:kcalculus/models/amount.dart';

class NutritionFacts {
  final Amount amount;
  final double calories;
  final double fatInGrams;
  final double carbsInGrams;
  final double fiberInGrams;
  final double proteinInGrams;

  const NutritionFacts({
    required this.amount,
    required this.calories,
    required this.fatInGrams,
    required this.carbsInGrams,
    required this.fiberInGrams,
    required this.proteinInGrams,
  });
}
