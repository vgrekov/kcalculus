import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/usda/_common/models/usda_nutrients.dart';
import 'package:kcalculus/data/usda/_common/models/usda_portion_units.dart';
import 'package:kcalculus/data/usda/_common/models/usda_units.dart';
import 'package:kcalculus/data/usda/food/models/usda_food_db_model.dart';
import 'package:kcalculus/data/usda/nutrient/models/usda_nutrient_db_model.dart';
import 'package:kcalculus/data/usda/portion/models/usda_portion_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts_preview.dart';
import 'package:kcalculus/domain/models/units.dart';

class UsdaFoodConverter extends Notifier<void> {
  @override
  void build() {}

  EdibleSearchResult toSearchResult(UsdaFoodDbModel dbModel) {
    return EdibleSearchResult(
      id: dbModel.fdc_id.toString(),
      name: dbModel.name,
      description: dbModel.description,
      type: EdibleSearchResultType.usda,
      nutritionFactsPreview:
          _getNutritionFactsPreview(dbModel)?.withPrecision(2),
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

  NutritionFactsPreview? _getNutritionFactsPreview(
    UsdaFoodDbModel dbModel,
  ) {
    final requirdFields = [
      dbModel.nf_preview_calories_unit,
      dbModel.nf_preview_calories_value,
      dbModel.nf_preview_fat_unit,
      dbModel.nf_preview_fat_value,
      dbModel.nf_preview_carbs_unit,
      dbModel.nf_preview_carbs_value,
      dbModel.nf_preview_protein_unit,
      dbModel.nf_preview_protein_value,
    ];

    if (requirdFields.any((f) => f == null)) {
      return null;
    }

    return NutritionFactsPreview(
      per: Amount(
        unit: Unit.gram,
        value: 100,
      ),
      calories: Amount(
        unit: kUsdaUnits[dbModel.nf_preview_calories_unit!]!,
        value: dbModel.nf_preview_calories_value!,
      ),
      fat: Amount(
        unit: kUsdaUnits[dbModel.nf_preview_fat_unit!]!,
        value: dbModel.nf_preview_fat_value!,
      ),
      carbs: Amount(
        unit: kUsdaUnits[dbModel.nf_preview_carbs_unit!]!,
        value: dbModel.nf_preview_carbs_value!,
      ),
      protein: Amount(
        unit: kUsdaUnits[dbModel.nf_preview_protein_unit!]!,
        value: dbModel.nf_preview_protein_value!,
      ),
      fiber: (dbModel.nf_preview_fiber_unit == null ||
              dbModel.nf_preview_fiber_value == null)
          ? null
          : Amount(
              unit: kUsdaUnits[dbModel.nf_preview_fiber_unit!]!,
              value: dbModel.nf_preview_fiber_value!,
            ),
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

final usdaFoodConverterProvider = NotifierProvider<UsdaFoodConverter, void>(
  UsdaFoodConverter.new,
);
