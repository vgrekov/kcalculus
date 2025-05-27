import 'package:kcalculus/data/repositories/local/converters/nutrient_amount_converter.dart';
import 'package:kcalculus/data/services/local/database/nutrient_amount/nutrient_amount_db_model.dart';
import 'package:kcalculus/data/services/local/database/nutrition_facts/nutrition_facts_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';

class LocalNutritionFactsConverter {
  LocalNutritionFactsConverter({
    required LocalNutrientAmountConverter nutritionAmountConverter,
  }) : _nutritionAmountConverter = nutritionAmountConverter;

  final LocalNutrientAmountConverter _nutritionAmountConverter;

  NutritionFactsDbModel toDbModel(NutritionFacts model, String edibleId,
      [String? nutritionFactsId]) {
    return NutritionFactsDbModel(
      id: (nutritionFactsId ?? model.id)!,
      edible_id: edibleId,
      amount_unit: model.amount.unit.name,
      amount_value: model.amount.value,
    );
  }

  NutritionFacts toModel(
    NutritionFactsDbModel dbModel,
    List<NutrientAmountDbModel> nutritionAmountDbModels,
  ) {
    return NutritionFacts(
      amount: Amount(
        unit: Unit.of(dbModel.amount_unit),
        value: dbModel.amount_value,
      ),
      nutrientData: _nutritionAmountConverter.toModel(nutritionAmountDbModels),
    );
  }
}
