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

final edibleRepositoryProvider = Provider<EdibleRepository>(
  (ref) {
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    return LocalEdibleRepository(
      edibleDao: edibleDao,
    );
  },
);

final foodRepositoryProvider = Provider<FoodRepository>(
  (ref) {
    final foodDao = ref.watch(_localFoodDaoProvider);
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    return LocalFoodRepository(
      foodDao: foodDao,
      edibleDao: edibleDao,
    );
  },
);

final dishRepositoryProvider = Provider<DishRepository>(
  (ref) {
    final dishDao = ref.watch(_localDishDaoProvider);
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    return LocalDishRepository(
      dishDao: dishDao,
      edibleDao: edibleDao,
    );
  },
);

final mealRepositoryProvider = Provider<MealRepository>(
  (ref) {
    final mealDao = ref.watch(_localMealDaoProvider);
    return LocalMealRepository(
      mealDao: mealDao,
    );
  },
);
