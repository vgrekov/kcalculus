import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/usda/_common/converters/usda_food_converter.dart';
import 'package:kcalculus/data/usda/food/services/usda_food_service.dart';
import 'package:kcalculus/data/usda/nutrient/services/usda_nutrient_service.dart';
import 'package:kcalculus/data/usda/portion/services/usda_portion_service.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';
import 'package:kcalculus/domain/food/models/food.dart';

class UsdaFoodRepository extends Notifier<void> {
  @override
  void build() {}

  Future<List<EdibleSearchResult>> search(
    String? query, {
    int? limit,
    int? offset,
  }) async {
    final usdaFoodService = ref.read(usdaFoodServiceProvider.notifier);
    final usdaFoodConverter = ref.read(usdaFoodConverterProvider.notifier);

    final foodDbModels = await usdaFoodService.search(
      query,
      limit: limit,
      offset: offset,
    );

    return foodDbModels.map(usdaFoodConverter.toSearchResult).toList();
  }

  Future<Food?> getById(String id) async {
    final usdaFoodService = ref.read(usdaFoodServiceProvider.notifier);
    final usdaPortionService = ref.read(usdaPortionServiceProvider.notifier);
    final usdaNutrientService = ref.read(usdaNutrientServiceProvider.notifier);
    final usdaFoodConverter = ref.read(usdaFoodConverterProvider.notifier);

    final fdcId = int.tryParse(id);
    if (fdcId == null) return null;

    final foodDbModel = await usdaFoodService.getByFdcId(fdcId);
    if (foodDbModel == null) return null;

    final portionDbModels = await usdaPortionService.getByFdcId(fdcId);

    final nutrientDbModels = await usdaNutrientService.getByFdcId(fdcId);

    return usdaFoodConverter.toModel(
      foodDbModel,
      portionDbModels,
      nutrientDbModels,
    );
  }
}

final usdaFoodRepositoryProvider = NotifierProvider<UsdaFoodRepository, void>(
  UsdaFoodRepository.new,
);
