import 'package:kcalculus/models/nutrition.dart';

abstract interface class Edible {
  String get name;

  List<NutritionFacts> getNutritionFacts();
}

class Food implements Edible {
  @override
  final String name;
  final List<NutritionFacts> nutritionFacts;

  const Food({
    required this.name,
    required this.nutritionFacts,
  });

  @override
  List<NutritionFacts> getNutritionFacts() => nutritionFacts;
}
