import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';

abstract interface class Edible {
  String? get id;

  String get name;

  String get description;

  DateTime? get createdAt;

  DateTime? get updatedAt;

  List<NutritionFacts> getNutritionFacts();

  Map<String, dynamic> toJson();
}
