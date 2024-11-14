import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/edible_dao.dart';
import 'package:kcalculus/data/local/food_dao.dart';
import 'package:kcalculus/data/local/meal_dao.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/meal.dart';

abstract interface class MealDao {
  Future<void> add(Meal model);

  Future<List<Meal>> getByDate(DateTime date);

  Future<void> update(Meal model);

  Future<bool> delete(String id);
}

final mealDaoProvider = Provider<Future<MealDao>>((ref) {
  return ref.watch(localMealDaoProvider);
});

abstract interface class EdibleDao {
  Future<List<EdibleSearchResult>> search(String? query);

  Future<bool> exists(String name, String description);
}

final edibleDaoProvider = Provider<Future<EdibleDao>>((ref) {
  return ref.watch(localEdibleDaoProvider);
});

abstract interface class FoodDao {
  Future<List<EdibleSearchResult>> search(String? query);

  Future<Food?> getById(String id);
}

final foodDaoProvider = Provider<Future<FoodDao>>((ref) {
  return ref.watch(localFoodDaoProvider);
});
