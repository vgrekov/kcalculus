// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';

part 'product_api_model.freezed.dart';
part 'product_api_model.g.dart';

@freezed
sealed class ProductApiModel with _$ProductApiModel {
  static const _kNutritionDataPerServing = 'serving';

  static const _kNutritionDataPer100g = '100g';

  static final _kPerAmounts = <String, Amount>{
    _kNutritionDataPerServing: Amount(
      unit: Unit.piece,
      value: 1,
    ),
    _kNutritionDataPer100g: Amount(
      unit: Unit.gram,
      value: 100,
    ),
  };

  static const _kServingToNutrientUnits = <String, Unit>{
    'g': Unit.gram,
    'ml': Unit.millilitre,
  };

  static const _kNutrientToNutrimentIds = <Nutrient, String>{
    Nutrient.energy: 'energy-kcal',
    Nutrient.fat: 'fat',
    Nutrient.saturatedFat: 'saturated-fat',
    Nutrient.unsaturatedFat: 'unsaturated-fat',
    Nutrient.monounsaturatedFat: 'monounsaturated-fat',
    Nutrient.omega9Fat: 'omega-9-fat',
    Nutrient.polyunsaturatedFat: 'polyunsaturated-fat',
    Nutrient.omega3Fat: 'omega-3-fat',
    Nutrient.omega6Fat: 'omega-6-fat',
    Nutrient.transFat: 'trans-fat',
    Nutrient.cholesterol: 'cholesterol',
    Nutrient.sodium: 'sodium',
    Nutrient.totalCarbs: 'carbohydrates-total',
    Nutrient.fiber: 'fiber',
    Nutrient.sugar: 'sugars',
    Nutrient.polyols: 'polyols',
    Nutrient.erythritol: 'erythritol',
    Nutrient.protein: 'proteins',
    Nutrient.vitaminA: 'vitamin-a',
    Nutrient.betaCarotene: 'beta-carotene',
    Nutrient.vitaminD: 'vitamin-d',
    Nutrient.vitaminE: 'vitamin-e',
    Nutrient.vitaminK: 'vitamin-k',
    Nutrient.vitaminC: 'vitamin-c',
    Nutrient.vitaminB1: 'vitamin-b1',
    Nutrient.vitaminB2: 'vitamin-b2',
    Nutrient.vitaminB3: 'vitamin-pp',
    Nutrient.vitaminB6: 'vitamin-b6',
    Nutrient.vitaminB9: 'vitamin-b9',
    Nutrient.vitaminB12: 'vitamin-b12',
    Nutrient.biotin: 'biotin',
    Nutrient.vitaminB5: 'pantothenic-acid',
    Nutrient.calcium: 'calcium',
    Nutrient.iron: 'iron',
    Nutrient.potassium: 'potassium',
    Nutrient.silica: 'silica',
    Nutrient.bicarbonate: 'bicarbonate',
    Nutrient.chloride: 'chloride',
    Nutrient.phosphorus: 'phosphorus',
    Nutrient.magnesium: 'magnesium',
    Nutrient.zinc: 'zinc',
    Nutrient.copper: 'copper',
    Nutrient.manganese: 'manganese',
    Nutrient.fluoride: 'fluoride',
    Nutrient.selenium: 'selenium',
    Nutrient.chromium: 'chromium',
    Nutrient.molybdenum: 'molybdenum',
    Nutrient.iodine: 'iodine',
    Nutrient.caffeine: 'caffeine',
    Nutrient.taurine: 'taurine',
    Nutrient.chlorophyl: 'chlorophyl',
    Nutrient.sulfate: 'sulfate',
    Nutrient.nitrate: 'nitrate',
  };

  static const _kNetCarbsNutrimentId = 'carbohydrates';

  static const _kNutrimentToNutrientUnits = <String, Unit>{
    'kcal': Unit.calorie,
    'g': Unit.gram,
    'mg': Unit.milligram,
    'µg': Unit.microgram,
  };

  const ProductApiModel._();

  const factory ProductApiModel({
    required String product_name,
    String? brands,
    String? serving_quantity_unit,
    Object? serving_quantity,
    String? nutrition_data_per,
    Map<String, dynamic>? nutriments,
  }) = _ProductApiModel;

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  Food toDomain({
    required List<Nutrient> nutrientDefaults,
  }) {
    List<NutritionFacts> nutritionFacts = [];
    if (nutrition_data_per != null && nutriments != null) {
      final perAmount = _kPerAmounts[nutrition_data_per];

      if (perAmount != null) {
        final nutritionAmounts = <NutrientAmount>[];

        // Collect whatever nutrient info came from OFF
        for (final nutrient in Nutrient.values) {
          final amount =
              _getNutrientAmount(nutrient)?.tryConvert(nutrient.defaultUnit);
          if (amount != null) {
            nutritionAmounts.add(
              NutrientAmount(
                nutrient: nutrient,
                amount: amount,
              ),
            );
          }
        }

        // A handy map of amounts by nutrients
        final nutritionAmountsMap = {
          for (final na in nutritionAmounts) na.nutrient: na.amount,
        };

        // Sometimes net carbs are provided instead of total carbs
        final netCarbsAmount = _getNutrimentAmount(_kNetCarbsNutrimentId);
        if (!nutritionAmountsMap.containsKey(Nutrient.totalCarbs) &&
            netCarbsAmount != null) {
          Amount totalCarbsAmount = netCarbsAmount;

          final fiberAmount = nutritionAmountsMap[Nutrient.fiber];
          if (fiberAmount != null) {
            totalCarbsAmount += fiberAmount;
          }

          nutritionAmounts.add(
            NutrientAmount(
              nutrient: Nutrient.totalCarbs,
              amount: totalCarbsAmount,
            ),
          );
          nutritionAmountsMap[Nutrient.totalCarbs] = totalCarbsAmount;
        }

        // A map of positions by nutrients (used below for sorting)
        final nutrientDefaultPositions = {
          for (final pair in nutrientDefaults.indexed) pair.$2: pair.$1,
        };

        final nf = NutritionFacts(
          amount: perAmount,
          nutrientData: NutrientData(
            nutrientAmounts: nutritionAmounts
              ..sort(
                (na1, na2) =>
                    (nutrientDefaultPositions[na1.nutrient] ??
                        Nutrient.values.length) -
                    (nutrientDefaultPositions[na2.nutrient] ??
                        Nutrient.values.length),
              ),
          ),
        );

        nutritionFacts.add(nf);

        if (nutrition_data_per == _kNutritionDataPerServing &&
            serving_quantity != null) {
          final servingUnit = _kServingToNutrientUnits[serving_quantity_unit];
          final servingValue = double.tryParse(serving_quantity!.toString());
          if (servingUnit != null && servingValue != null) {
            nutritionFacts.add(
              nf.copyWith(
                amount: Amount(
                  unit: servingUnit,
                  value: servingValue,
                ),
              ),
            );
          }
        }
      }
    }

    return Food(
      name: product_name,
      description: brands ?? '',
      nutritionFacts: nutritionFacts,
    );
  }

  Amount? _getNutrientAmount(Nutrient nutrient) {
    return _getNutrimentAmount(_kNutrientToNutrimentIds[nutrient]);
  }

  Amount? _getNutrimentAmount(String? nutrimentId) {
    if (nutriments?.isEmpty ?? true) {
      return null;
    }

    if (nutrimentId != null) {
      final nutrimentUnit = nutriments?['${nutrimentId}_unit'] as String?;
      final nutrientUnit = _kNutrimentToNutrientUnits[nutrimentUnit];
      final nutrimentValue =
          (nutriments?['${nutrimentId}_value'] as num?)?.toDouble();

      if (nutrientUnit != null && nutrimentValue != null) {
        return Amount(
          unit: nutrientUnit,
          value: nutrimentValue,
        );
      }
    }

    return null;
  }
}
