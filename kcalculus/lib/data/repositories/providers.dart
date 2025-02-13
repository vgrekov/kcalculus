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

final _foodChangesStreamControllerProvider = Provider<StreamController<void>>(
  (ref) {
    final controller = StreamController<void>.broadcast();
    ref.onDispose(controller.close);
    return controller;
  },
);

final foodChangesProvider = StreamProvider<void>(
  (ref) {
    ref.watch(_databaseServiceProvider);
    final controller = ref.watch(_foodChangesStreamControllerProvider);
    return controller.stream;
  },
);

final foodRepositoryProvider = Provider<FoodRepository>(
  (ref) {
    final foodDao = ref.watch(_localFoodDaoProvider);
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    final changeController = ref.watch(_foodChangesStreamControllerProvider);
    return LocalFoodRepository(
      foodDao: foodDao,
      edibleDao: edibleDao,
      changeController: changeController,
    );
  },
);

final _dishChangesStreamControllerProvider = Provider<StreamController<void>>(
  (ref) {
    final controller = StreamController<void>.broadcast();
    ref.onDispose(controller.close);
    return controller;
  },
);

final dishChangesProvider = StreamProvider<void>(
  (ref) {
    ref.watch(_databaseServiceProvider);
    final controller = ref.watch(_dishChangesStreamControllerProvider);
    return controller.stream;
  },
);

final dishRepositoryProvider = Provider<DishRepository>(
  (ref) {
    final dishDao = ref.watch(_localDishDaoProvider);
    final edibleDao = ref.watch(_localEdibleDaoProvider);
    final changeController = ref.watch(_dishChangesStreamControllerProvider);
    return LocalDishRepository(
      dishDao: dishDao,
      edibleDao: edibleDao,
      changeController: changeController,
    );
  },
);

final _mealChangesStreamControllerProvider = Provider<StreamController<void>>(
  (ref) {
    final controller = StreamController<void>.broadcast();
    ref.onDispose(controller.close);
    return controller;
  },
);

final mealChangesProvider = StreamProvider<void>(
  (ref) {
    ref.watch(_databaseServiceProvider);
    final controller = ref.watch(_mealChangesStreamControllerProvider);
    return controller.stream;
  },
);

final mealRepositoryProvider = Provider<MealRepository>(
  (ref) {
    final mealDao = ref.watch(_localMealDaoProvider);
    final changeController = ref.watch(_mealChangesStreamControllerProvider);
    return LocalMealRepository(
      mealDao: mealDao,
      changeController: changeController,
    );
  },
);

final backupRepositoryProvider = Provider<BackupRepository>(
  (ref) {
    ref.watch(_databaseServiceProvider);

    final dbManager = ref.read(_databaseServiceProvider.notifier);

    return BackupRepository(
      dbManager: dbManager,
    );
  },
);
