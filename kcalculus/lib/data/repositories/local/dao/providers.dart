part of '../../../providers.dart';

// DAO

final _localEdibleDaoProvider = FutureProvider(
  (ref) async {
    final dbService = await ref.watch(_databaseServiceProvider.future);
    final edibleSearchResultConverter =
        ref.watch(_localEdibleSearchResultConverter);
    return LocalEdibleDao(
      dbService: dbService,
      edibleSearchResultConverter: edibleSearchResultConverter,
    );
  },
);

final _localFoodDaoProvider = FutureProvider(
  (ref) async {
    final dbService = await ref.watch(_databaseServiceProvider.future);
    final foodConverter = ref.watch(_localFoodConverterProvider);
    final nutritionFactsConverter =
        ref.watch(_localNutritionFactsConverterProvider);
    return LocalFoodDao(
      dbService: dbService,
      foodConverter: foodConverter,
      nutritionFactsConverter: nutritionFactsConverter,
    );
  },
);

final _localDishDaoProvider = FutureProvider(
  (ref) async {
    final dbService = await ref.watch(_databaseServiceProvider.future);
    final foodDao = await ref.watch(_localFoodDaoProvider.future);
    final dishConverter = ref.watch(_localDishConverterProvider);
    final ingredientConverter = ref.watch(_localIngredientConverterProvider);
    return LocalDishDao(
      dbService: dbService,
      foodDao: foodDao,
      dishConverter: dishConverter,
      ingredientConverter: ingredientConverter,
    );
  },
);
