import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition.dart';
import 'package:kcalculus/utils/string_ext.dart';

class Food implements Edible {
  @override
  String? id;
  @override
  final String name;
  @override
  final String description;
  final List<NutritionFacts> nutritionFacts;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  Food({
    this.id,
    required this.name,
    required this.description,
    required this.nutritionFacts,
    this.createdAt,
    this.updatedAt,
  });

  Food copy() {
    return Food(
      name: name.nextVersion(),
      description: description,
      nutritionFacts: nutritionFacts,
    );
  }

  @override
  List<NutritionFacts> getNutritionFacts() => nutritionFacts;
}
