import 'package:kcalculus/data/services/local/database/nutrient_amount/nutrient_amount_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/units.dart';

class LocalNutrientAmountConverter {
  List<NutrientAmountDbModel> toDbModels(
      NutrientData model, String nutritionFactsId) {
    return model.nutrientAmounts.entries
        .map(
          (e) => NutrientAmountDbModel(
            nutrition_facts_id: nutritionFactsId,
            nutrient: e.key.name,
            amount_unit: e.value.unit.name,
            amount_value: e.value.value,
          ),
        )
        .toList();
  }

  NutrientData toModel(List<NutrientAmountDbModel> dbModels) {
    return NutrientData(nutrientAmounts: {
      for (final dbModel in dbModels)
        Nutrient.of(dbModel.nutrient): Amount(
          unit: Unit.of(dbModel.amount_unit),
          value: dbModel.amount_value,
        ),
    });
  }
}
