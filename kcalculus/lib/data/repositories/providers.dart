part of '../providers.dart';

// Repositories

final appSettingsRepositoryProvider =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  () {
    return LocalAppSettingsRepository(
      service: AppSettingsSharedPrefService(),
    );
  },
);

final edibleRepositoryProvider = FutureProvider<EdibleRepository>(
  (ref) async {
    final edibleDao = await ref.watch(_localEdibleDaoProvider.future);
    return LocalEdibleRepository(
      edibleDao: edibleDao,
    );
  },
);

final foodRepositoryProvider = FutureProvider<FoodRepository>(
  (ref) async {
    final foodDao = await ref.watch(_localFoodDaoProvider.future);
    return LocalFoodRepository(
      foodDao: foodDao,
    );
  },
);

final dishRepositoryProvider = FutureProvider<DishRepository>(
  (ref) async {
    final dishDao = await ref.watch(_localDishDaoProvider.future);
    return LocalDishRepository(
      dishDao: dishDao,
    );
  },
);

final mealRepositoryProvider = FutureProvider<MealRepository>(
  (ref) async {
    final mealDao = await ref.watch(_localMealDaoProvider.future);
    return LocalMealRepository(
      mealDao: mealDao,
    );
  },
);
