part of '../../../providers.dart';

// DAO

final _localEdibleDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final edibleSearchResultConverter =
        ref.watch(_localEdibleSearchResultConverter);
    return LocalEdibleDao(
      dbService: dbService,
      edibleSearchResultConverter: edibleSearchResultConverter,
    );
  },
);

final _localNutritionFactsDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final nutritionFactsConverter =
        ref.watch(_localNutritionFactsConverterProvider);
    final nutrientAmountConverter =
        ref.watch(_localNutrientAmountConverterProvider);
    return LocalNutritionFactsDao(
      dbService: dbService,
      nutritionFactsConverter: nutritionFactsConverter,
      nutrientAmountConverter: nutrientAmountConverter,
    );
  },
);

final _localFoodDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    final nutritionFactsDao = ref.watch(_localNutritionFactsDaoProvider);
    final foodConverter = ref.watch(_localFoodConverterProvider);
    return LocalFoodDao(
      dbService: dbService,
      edibleDao: edibleDao,
      nutritionFactsDao: nutritionFactsDao,
      foodConverter: foodConverter,
    );
  },
);

final _localDishDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    final foodDao = ref.watch(_localFoodDaoProvider);
    final dishConverter = ref.watch(_localDishConverterProvider);
    final ingredientConverter = ref.watch(_localIngredientConverterProvider);
    return LocalDishDao(
      dbService: dbService,
      edibleDao: edibleDao,
      foodDao: foodDao,
      dishConverter: dishConverter,
      ingredientConverter: ingredientConverter,
    );
  },
);

final _localMealDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final foodDao = ref.watch(_localFoodDaoProvider);
    final dishDao = ref.watch(_localDishDaoProvider);
    final mealConverter = ref.watch(_localMealConverterProvider);
    return LocalMealDao(
      dbService: dbService,
      foodDao: foodDao,
      dishDao: dishDao,
      mealConverter: mealConverter,
    );
  },
);

final _localDefaultNutrientDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final defaultNutrientConverter =
        ref.watch(_localDefaultNutrientConverterProvider);
    return LocalDefaultNutrientDao(
      dbService: dbService,
      defaultNutrientConverter: defaultNutrientConverter,
    );
  },
);
