import 'dart:async';
import 'dart:io';

import 'package:kcalculus/data/exceptions/localized_exception.dart';
import 'package:kcalculus/data/services/local/database/default_nutrient/default_nutrient_service.dart';
import 'package:kcalculus/data/services/local/database/dish/dish_service.dart';
import 'package:kcalculus/data/services/local/database/edible/edible_service.dart';
import 'package:kcalculus/data/services/local/database/food/food_service.dart';
import 'package:kcalculus/data/services/local/database/food_container/food_container_service.dart';
import 'package:kcalculus/data/services/local/database/ingredient/ingredient_service.dart';
import 'package:kcalculus/data/services/local/database/meal/meal_service.dart';
import 'package:kcalculus/data/services/local/database/nutrient_amount/nutrient_amount_service.dart';
import 'package:kcalculus/data/services/local/database/nutrient_goal/nutrient_goal_service.dart';
import 'package:kcalculus/data/services/local/database/nutrition_facts/nutrition_facts_service.dart';
import 'package:kcalculus/data/utils/db_utils.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const _kDbName = 'kcalculus.db';

  static const _kDbVersion = 21;

  static const _kDbMigrationsDir = 'assets/db/migrations';

  static FutureOr<bool> isMigrationRequired() async {
    try {
      return await isDbMigrationRequired(_kDbName, _kDbVersion);
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskDbMigrationFailedMessage,
        cause: error,
      );
    }
  }

  static FutureOr<void> migrateDatabase() async {
    try {
      await migrateDb(
        _kDbName,
        _kDbVersion,
        _kDbMigrationsDir,
      );
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskDbMigrationFailedMessage,
        cause: error,
      );
    }
  }

  static Future<File> exportDatabase() {
    return exportDb(_kDbName);
  }

  static Future<void> importDatabase(File fromFile) async {
    return importDb(fromFile, _kDbName, _kDbVersion, _kDbMigrationsDir);
  }

  DatabaseService() {
    _database = openDb(_kDbName);
    nutritionFacts = NutritionFactsService(_database);
    edible = EdibleService(_database);
    food = FoodService(_database);
    ingredient = IngredientService(_database);
    dish = DishService(_database);
    meal = MealService(_database);
    foodContainer = FoodContainerService(_database);
    defaultNutrient = DefaultNutrientService(_database);
    nutrientAmount = NutrientAmountService(_database);
    nutrientGoal = NutrientGoalService(_database);
  }

  late final Future<Database> _database;

  late final NutritionFactsService nutritionFacts;

  late final EdibleService edible;

  late final FoodService food;

  late final IngredientService ingredient;

  late final DishService dish;

  late final MealService meal;

  late final FoodContainerService foodContainer;

  late final DefaultNutrientService defaultNutrient;

  late final NutrientAmountService nutrientAmount;

  late final NutrientGoalService nutrientGoal;

  Future<T> transaction<T>(Future<T> Function(Transaction) action) async {
    final db = await _database;
    return db.transaction(action);
  }

  Future<void> dispose() async {
    final db = await _database;
    return db.close();
  }
}
