import 'package:kcalculus/data/repositories/usda/usda_nutrients.dart';
import 'package:kcalculus/data/repositories/usda/usda_portion_units.dart';
import 'package:kcalculus/data/repositories/usda/usda_units.dart';
import 'package:kcalculus/data/services/usda/food_usda_model.dart';
import 'package:kcalculus/data/services/usda/nutrient_usda_model.dart';
import 'package:kcalculus/data/services/usda/portion_usda_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/string_ext.dart';

class UsdaFoodConverter {
  static final _kDescriptionDelim = RegExp(r'\s*,\s*');

  EdibleSearchResult toSearchResult(FoodUsdaModel usdaModel) {
    final (name, description) = _splitDescription(usdaModel.description);

    return EdibleSearchResult(
      id: usdaModel.fdcId.toString(),
      name: name,
      description: description,
      type: EdibleSearchResultType.usda,
    );
  }

  Food toModel(FoodUsdaModel usdaModel) {
    final (name, description) = _splitDescription(usdaModel.description);

    final mainNutrientData = _mainNutrientData(usdaModel);

    return Food(
      name: name,
      description: description,
      nutritionFacts: [
        NutritionFacts(
          amount: Amount(unit: Unit.gram, value: 100),
          nutrientData: mainNutrientData.withPrecision(2),
        ),
        ...usdaModel.portions
            .map(
              (portion) => _portionNutritionFacts(
                usdaModel,
                portion,
                mainNutrientData,
              ),
            )
            .nonNulls
      ],
    );
  }

  (String, String) _splitDescription(String description) {
    final chunks = description
        .trim()
        .split(_kDescriptionDelim)
        .where((c) => c.isNotEmpty)
        .toList();
    return (
      chunks.firstOrNull?.capitalize() ?? '',
      chunks.isEmpty ? '' : chunks.sublist(1).join(', ').capitalize(),
    );
  }

  NutrientData _mainNutrientData(FoodUsdaModel usdaModel) {
    final nutrientAmounts = usdaModel.nutrients
        .where(
          (n) =>
              kUsdaNutrientsPrioritized.containsKey(n.number) &&
              kUsdaUnits.containsKey(n.unitName),
        )
        .fold(
          <Nutrient, (NutrientUsdaModel, int)>{},
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
              unit: kUsdaUnits[e.value.$1.unitName]!,
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
    FoodUsdaModel usdaModel,
    PortionUsdaModel portion,
    NutrientData mainNutrientData,
  ) {
    if (portion.amount == null ||
        !kUsdaPortionUnits.containsKey(portion.measureUnitId)) {
      return null;
    }

    return NutritionFacts(
      amount: Amount(
        unit: kUsdaPortionUnits[portion.measureUnitId]!,
        value: portion.amount!,
      ),
      nutrientData:
          (mainNutrientData * (portion.gramWeight / 100)).withPrecision(2),
    );
  }
}
