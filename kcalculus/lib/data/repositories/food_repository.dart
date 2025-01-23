import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/local/converters/food_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/data/repositories/local/food_repository.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/food.dart';

abstract interface class FoodRepository {
  Future<Food?> getById(String id);

  Future<Food> save(Food food);
}

final foodRepository = FutureProvider<FoodRepository>(
  (ref) async {
    final dbService = await ref.watch(databaseService.future);
    final foodConverter = ref.watch(localFoodConverter);
    final nutritionFactsConverter = ref.watch(localNutritionFactsConverter);
    return LocalFoodRepository(
      dbService: dbService,
      foodConverter: foodConverter,
      nutritionFactsConverter: nutritionFactsConverter,
    );
  },
);
