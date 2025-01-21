import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/local/dish_dao.dart';
import 'package:kcalculus/data/local/edible_dao.dart';
import 'package:kcalculus/data/local/food_dao.dart';
import 'package:kcalculus/data/local/meal_dao.dart';
import 'package:kcalculus/domain/models/dish.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/meal.dart';

abstract interface class MealDao {
  Future<void> add(Meal model);

  Future<List<Meal>> getByDate(DateTime date);

  Future<void> update(Meal model);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

final mealDaoProvider = Provider<Future<MealDao>>((ref) {
  return ref.watch(localMealDaoProvider);
});

abstract interface class EdibleDao {
  Future<List<EdibleSearchResult>> search(String? query);

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  });

  Future<bool> delete(String id);

  Future<bool> restore(String id);

  Future<bool> wasEaten(String id);
}

final edibleDaoProvider = Provider<Future<EdibleDao>>((ref) {
  return ref.watch(localEdibleDaoProvider);
});

abstract interface class FoodDao {
  Future<void> save(Food model);

  Future<List<EdibleSearchResult>> search(String? query);

  Future<Food?> getById(String id);
}

final foodDaoProvider = Provider<Future<FoodDao>>((ref) {
  return ref.watch(localFoodDaoProvider);
});

abstract interface class DishDao {
  Future<void> save(Dish model);

  Future<List<EdibleSearchResult>> search(String? query);

  Future<Dish?> getById(String id);
}

final dishDaoProvider = Provider<Future<DishDao>>((ref) {
  return ref.watch(localDishDaoProvider);
});
