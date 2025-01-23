import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/local/converters/dish_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/food_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/ingredient_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/data/repositories/local/dish_repository.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';

abstract interface class DishRepository {
  Future<Dish?> getById(String id);

  Future<Dish> save(Dish dish);
}

final dishRepository = FutureProvider<DishRepository>(
  (ref) async {
    final dbService = await ref.watch(databaseService.future);
    final dishConverter = ref.watch(localDishConverter);
    final ingredientConverter = ref.watch(localIngredientConverter);
    final foodConverter = ref.watch(localFoodConverter);
    final nutritionFactsConverter = ref.watch(localNutritionFactsConverter);
    return LocalDishRepository(
      dbService: dbService,
      dishConverter: dishConverter,
      ingredientConverter: ingredientConverter,
      foodConverter: foodConverter,
      nutritionFactsConverter: nutritionFactsConverter,
    );
  },
);
