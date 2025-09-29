import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/food/models/food_db_model.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalFoodConverter extends Notifier<void> {
  @override
  void build() {}

  FoodDbModel toDbModel(Food model, [String? foodId]) {
    final nf = model.getNutritionFacts().firstOrNull;

    return FoodDbModel(
      id: (foodId ?? model.id)!,
      name: model.name,
      description: model.description,
      nf_preview_per_unit: nf?.amount.unit.name,
      nf_preview_per_value: nf?.amount.value,
      nf_preview_calories_unit: Unit.calorie.name,
      nf_preview_calories_value: nf?.nutrientData.calories,
      nf_preview_fat_unit: Unit.gram.name,
      nf_preview_fat_value: nf?.nutrientData.fatInGrams,
      nf_preview_carbs_unit: Unit.gram.name,
      nf_preview_carbs_value: nf?.nutrientData.carbsInGrams,
      nf_preview_protein_unit: Unit.gram.name,
      nf_preview_protein_value: nf?.nutrientData.proteinInGrams,
      nf_preview_fiber_unit: Unit.gram.name,
      nf_preview_fiber_value: nf?.nutrientData.fiberInGrams,
    );
  }

  Food toModel(
    FoodDbModel dbModel,
    List<NutritionFacts> nutritionFacts,
  ) {
    return Food(
      id: dbModel.id,
      name: dbModel.name,
      description: dbModel.description ?? '',
      nutritionFacts: nutritionFacts,
      createdAt: dbModel.created_at != null
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: dbModel.updated_at != null
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
    );
  }
}

final localFoodConverterProvider = NotifierProvider<LocalFoodConverter, void>(
  LocalFoodConverter.new,
);
