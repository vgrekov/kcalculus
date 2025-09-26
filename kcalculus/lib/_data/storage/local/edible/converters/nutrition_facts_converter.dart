import 'package:kcalculus/_data/storage/local/edible/converters/nutrient_amount_converter.dart';
import 'package:kcalculus/_data/storage/local/edible/models/nutrient_amount_db_model.dart';
import 'package:kcalculus/_data/storage/local/edible/models/nutrition_facts_db_model.dart';
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
      id: dbModel.id,
      amount: Amount(
        unit: Unit.of(dbModel.amount_unit),
        value: dbModel.amount_value,
      ),
      nutrientData: _nutritionAmountConverter.toModel(nutritionAmountDbModels),
    );
  }
}
