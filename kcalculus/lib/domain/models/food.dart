import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/utils/string_ext.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
class Food with _$Food implements Edible {
  const Food._();

  const factory Food({
    String? id,
    required String name,
    required String description,
    required List<NutritionFacts> nutritionFacts,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Food;

  @override
  List<NutritionFacts> getNutritionFacts() => nutritionFacts;

  Food copy() {
    return Food(
      name: name.nextVersion(),
      description: description,
      nutritionFacts: nutritionFacts,
    );
  }
}
