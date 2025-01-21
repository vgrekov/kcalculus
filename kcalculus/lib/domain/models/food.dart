import 'package:kcalculus/domain/models/identifiable.dart';
import 'package:kcalculus/domain/models/nutrition.dart';
import 'package:kcalculus/utils/string_ext.dart';

abstract interface class Edible with Identifiable {
  String get name;
  String get description;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  List<NutritionFacts> getNutritionFacts();
}

class Food with Identifiable implements Edible {
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
    String? id,
    required this.name,
    required this.description,
    required this.nutritionFacts,
    this.createdAt,
    this.updatedAt,
  }) {
    super.id = id;
  }

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

enum EdibleSearchResultType {
  food,
  dish,
}

class EdibleSearchResult with Identifiable {
  final String name;
  final String description;
  final EdibleSearchResultType type;
  final DateTime? lastEatenAt;

  EdibleSearchResult({
    String? id,
    required this.name,
    required this.description,
    required this.type,
    this.lastEatenAt,
  }) {
    this.id = id;
  }
}
