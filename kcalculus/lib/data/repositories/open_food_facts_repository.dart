import 'package:kcalculus/data/services/open_food_facts/open_food_facts_service.dart';
import 'package:kcalculus/data/services/open_food_facts/product_api_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';

class OpenFoodFactsRepository {
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

  OpenFoodFactsRepository({
    required OpenFoodFactsService service,
  }) : _service = service;

  final OpenFoodFactsService _service;

  Future<Food?> getFoodByBarcode(String barcode) async {
    final product = await _service.getProductByBarcode(barcode);

    return _productToFood(product);
  }

  Food? _productToFood(ProductApiModel? product) {
    if (product == null) {
      return null;
    }

    List<NutritionFacts> nutritionFacts = [];
    if (product.nutrition_data_per != null && product.nutriments != null) {
      final perAmount = _kPerAmounts[product.nutrition_data_per];

      if (perAmount != null) {
        final nutritionAmounts = {
          for (final nutrient in Nutrient.values)
            if (_getNutrientAmount(product, nutrient)
                    ?.tryConvert(nutrient.defaultUnit)
                case Amount amount)
              nutrient: amount,
        };

        final netCarbsAmount =
            _getNutrimentAmount(product, _kNetCarbsNutrimentId);
        if (!nutritionAmounts.containsKey(Nutrient.totalCarbs) &&
            netCarbsAmount != null) {
          Amount totalCarbsAmount = netCarbsAmount;
          if (nutritionAmounts.containsKey(Nutrient.fiber)) {
            totalCarbsAmount += nutritionAmounts[Nutrient.fiber]!;
          }

          nutritionAmounts[Nutrient.totalCarbs] = totalCarbsAmount;
        }

        final nf = NutritionFacts(
          amount: perAmount,
          nutrientData: NutrientData(
            nutrientAmounts: nutritionAmounts,
          ),
        );

        nutritionFacts.add(nf);

        if (product.nutrition_data_per == _kNutritionDataPerServing &&
            product.serving_quantity != null) {
          final servingUnit =
              _kServingToNutrientUnits[product.serving_quantity_unit];
          final servingValue =
              double.tryParse(product.serving_quantity!.toString());
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
      name: product.product_name,
      description: product.brands ?? '',
      nutritionFacts: nutritionFacts,
    );
  }

  Amount? _getNutrientAmount(ProductApiModel product, Nutrient nutrient) {
    return _getNutrimentAmount(product, _kNutrientToNutrimentIds[nutrient]);
  }

  Amount? _getNutrimentAmount(ProductApiModel product, String? nutrimentId) {
    if (product.nutriments?.isEmpty ?? true) {
      return null;
    }

    if (nutrimentId != null) {
      final nutrimentUnit =
          product.nutriments?['${nutrimentId}_unit'] as String?;
      final nutrientUnit = _kNutrimentToNutrientUnits[nutrimentUnit];
      final nutrimentValue =
          (product.nutriments?['${nutrimentId}_value'] as num?)?.toDouble();

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
