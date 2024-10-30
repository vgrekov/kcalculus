import 'package:kcalculus/models/identifiable.dart';
import 'package:kcalculus/models/nutrition.dart';

abstract interface class Edible with Identifiable {
  String get name;

  List<NutritionFacts> getNutritionFacts();
}

class Food with Identifiable implements Edible {
  @override
  final String name;
  final List<NutritionFacts> nutritionFacts;

  Food({
    String? id,
    required this.name,
    required this.nutritionFacts,
  }) {
    this.id = id;
  }

  @override
  List<NutritionFacts> getNutritionFacts() => nutritionFacts;
}
