import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/services/local/database/dao/nutrition_facts/nutrition_facts_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';

class LocalNutritionFactsConverter {
  NutritionFactsDbModel toDbModel(NutritionFacts model, String edibleId) {
    return NutritionFactsDbModel(
      edible_id: edibleId,
      amount_unit: model.amount.unit.name,
      amount_value: model.amount.value,
      calories: model.nutrientData.calories,
      fat_in_grams: model.nutrientData.fatInGrams,
      carbs_in_grams: model.nutrientData.carbsInGrams,
      fiber_in_grams: model.nutrientData.fiberInGrams,
      protein_in_grams: model.nutrientData.proteinInGrams,
    );
  }

  NutritionFacts toModel(NutritionFactsDbModel dbModel) {
    return NutritionFacts(
      amount: Amount(
        unit: Unit.of(dbModel.amount_unit),
        value: dbModel.amount_value,
      ),
      nutrientData: NutrientData(
        calories: dbModel.calories,
        fatInGrams: dbModel.fat_in_grams,
        carbsInGrams: dbModel.carbs_in_grams,
        fiberInGrams: dbModel.fiber_in_grams,
        proteinInGrams: dbModel.protein_in_grams,
      ),
    );
  }
}

final localNutritionFactsConverter = Provider(
  (ref) => LocalNutritionFactsConverter(),
);
