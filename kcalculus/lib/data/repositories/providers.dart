part of '../providers.dart';

// Repositories

final appSettingsRepository =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  () {
    return LocalAppSettingsRepository(
      service: AppSettingsSharedPrefService(),
    );
  },
);

final edibleRepository = FutureProvider<EdibleRepository>(
  (ref) async {
    final dbService = await ref.watch(_databaseService.future);
    return LocalEdibleRepository(
      dbService: dbService,
    );
  },
);

final foodRepository = FutureProvider<FoodRepository>(
  (ref) async {
    final dbService = await ref.watch(_databaseService.future);
    final foodConverter = ref.watch(_localFoodConverter);
    final nutritionFactsConverter = ref.watch(_localNutritionFactsConverter);
    return LocalFoodRepository(
      dbService: dbService,
      foodConverter: foodConverter,
      nutritionFactsConverter: nutritionFactsConverter,
    );
  },
);

final dishRepository = FutureProvider<DishRepository>(
  (ref) async {
    final dbService = await ref.watch(_databaseService.future);
    final dishConverter = ref.watch(_localDishConverter);
    final ingredientConverter = ref.watch(_localIngredientConverter);
    final foodConverter = ref.watch(_localFoodConverter);
    final nutritionFactsConverter = ref.watch(_localNutritionFactsConverter);
    return LocalDishRepository(
      dbService: dbService,
      dishConverter: dishConverter,
      ingredientConverter: ingredientConverter,
      foodConverter: foodConverter,
      nutritionFactsConverter: nutritionFactsConverter,
    );
  },
);
