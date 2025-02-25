import 'package:kcalculus/data/services/open_food_facts/open_food_facts_service.dart';
import 'package:kcalculus/data/services/open_food_facts/product_api_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food.dart';
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

  static const _kUnitToGramFactors = <String, double>{
    'kg': 1000,
    'mg': 0.001,
    'mcg': 0.000001,
    'µg': 0.000001,
    'g': 1,
  };

  static const _kServingUnits = <String, Unit>{
    'g': Unit.gram,
    'ml': Unit.millilitre,
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

      final fatFactor = _kUnitToGramFactors[product.nutriments!.fat_unit] ?? 0;

      final carbsFactor =
          _kUnitToGramFactors[product.nutriments!.carbohydrates_unit] ?? 0;

      final fiberFactor =
          _kUnitToGramFactors[product.nutriments!.fiber_unit] ?? 0;

      final proteinFactor =
          _kUnitToGramFactors[product.nutriments!.proteins_unit] ?? 0;

      if (perAmount != null) {
        final nf = NutritionFacts(
          amount: perAmount,
          nutrientData: NutrientData(
            calories: product.nutriments!.energy_kcal,
            fatInGrams: (product.nutriments!.fat_value ?? 0) * fatFactor,
            carbsInGrams:
                (product.nutriments!.carbohydrates_value ?? 0) * carbsFactor,
            fiberInGrams: (product.nutriments!.fiber_value ?? 0) * fiberFactor,
            proteinInGrams:
                (product.nutriments!.proteins_value ?? 0) * proteinFactor,
          ),
        );

        nutritionFacts.add(nf);

        if (product.nutrition_data_per == _kNutritionDataPerServing &&
            product.serving_quantity != null) {
          final servingUnit = _kServingUnits[product.serving_quantity_unit];
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
}
