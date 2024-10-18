import 'package:kcalculus/models/identifiable.dart';
import 'package:kcalculus/models/nutrition.dart';

abstract interface class Edible {
  String get name;

  List<NutritionFacts> getNutritionFacts();
}

class Food extends Identifiable implements Edible {
  @override
  final String name;
  final List<NutritionFacts> nutritionFacts;

  Food({
    super.id,
    required this.name,
    required this.nutritionFacts,
  });

  @override
  List<NutritionFacts> getNutritionFacts() => nutritionFacts;
}
