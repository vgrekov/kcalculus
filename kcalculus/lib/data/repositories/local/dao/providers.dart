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

final _localFoodDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    final foodConverter = ref.watch(_localFoodConverterProvider);
    final nutritionFactsConverter =
        ref.watch(_localNutritionFactsConverterProvider);
    return LocalFoodDao(
      dbService: dbService,
      edibleDao: edibleDao,
      foodConverter: foodConverter,
      nutritionFactsConverter: nutritionFactsConverter,
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

final _localFoodContainerDaoProvider = Provider(
  (ref) {
    final dbService = ref.watch(_databaseServiceProvider);
    final containerConverter = ref.watch(_localFoodContainerConverterProvider);
    return LocalFoodContainerDao(
      dbService: dbService,
      containerConverter: containerConverter,
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
