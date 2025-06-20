import 'package:kcalculus/data/repositories/usda/usda_nutrients.dart';
import 'package:kcalculus/data/repositories/usda/usda_portion_units.dart';
import 'package:kcalculus/data/repositories/usda/usda_units.dart';
import 'package:kcalculus/data/services/usda/food/usda_food_db_model.dart';
import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_db_model.dart';
import 'package:kcalculus/data/services/usda/portion/usda_portion_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';

class UsdaFoodConverter {
  EdibleSearchResult toSearchResult(UsdaFoodDbModel dbModel) {
    return EdibleSearchResult(
      id: dbModel.fdc_id.toString(),
      name: dbModel.name,
      description: dbModel.description,
      type: EdibleSearchResultType.usda,
    );
  }

  Food toModel(
    UsdaFoodDbModel dbModel,
    List<UsdaPortionDbModel> portionDbModels,
    List<UsdaNutrientDbModel> nutrientDbModels,
  ) {
    final mainNutrientData = _mainNutrientData(nutrientDbModels);

    return Food(
      name: dbModel.name,
      description: dbModel.description,
      nutritionFacts: [
        NutritionFacts(
          amount: Amount(unit: Unit.gram, value: 100),
          nutrientData: mainNutrientData.withPrecision(2),
        ),
        ...portionDbModels
            .map(
              (portion) => _portionNutritionFacts(
                portion,
                mainNutrientData,
              ),
            )
            .nonNulls
      ],
    );
  }

  NutrientData _mainNutrientData(List<UsdaNutrientDbModel> nutrientDbModels) {
    final nutrientAmounts = nutrientDbModels
        .where(
          (n) =>
              kUsdaNutrientsPrioritized.containsKey(n.number) &&
              kUsdaUnits.containsKey(n.unit_name),
        )
        .fold(
          <Nutrient, (UsdaNutrientDbModel, int)>{},
          (acc, n) {
            final (nutrient, priority) = kUsdaNutrientsPrioritized[n.number]!;
            return acc
              ..update(
                nutrient,
                (pair) => priority < pair.$2 ? (n, priority) : pair,
                ifAbsent: () => (n, priority),
              );
          },
        )
        .entries
        .map(
          (e) => NutrientAmount(
            nutrient: e.key,
            amount: Amount(
              unit: kUsdaUnits[e.value.$1.unit_name]!,
              value: e.value.$1.amount,
            ),
          ),
        )
        .toList(growable: true);

    final nutrientAmountsMap = {
      for (final na in nutrientAmounts) na.nutrient: na.amount,
    };

    if (nutrientAmountsMap.containsKey(Nutrient.monounsaturatedFat) &&
        nutrientAmountsMap.containsKey(Nutrient.polyunsaturatedFat)) {
      nutrientAmounts.add(
        NutrientAmount(
          nutrient: Nutrient.unsaturatedFat,
          amount: (nutrientAmountsMap[Nutrient.monounsaturatedFat]! +
                  nutrientAmountsMap[Nutrient.polyunsaturatedFat]!)
              .convert(Nutrient.unsaturatedFat.defaultUnit),
        ),
      );
    }

    return NutrientData(
      nutrientAmounts: nutrientAmounts,
    );
  }

  NutritionFacts? _portionNutritionFacts(
    UsdaPortionDbModel portionDbModel,
    NutrientData mainNutrientData,
  ) {
    if (portionDbModel.amount == null ||
        !kUsdaPortionUnits.containsKey(portionDbModel.measure_unit_id)) {
      return null;
    }

    return NutritionFacts(
      amount: Amount(
        unit: kUsdaPortionUnits[portionDbModel.measure_unit_id]!,
        value: portionDbModel.amount!,
      ),
      nutrientData: (mainNutrientData * (portionDbModel.gram_weight / 100))
          .withPrecision(2),
    );
  }
}
