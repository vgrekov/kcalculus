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

final openFoodFactsRepositoryProvider = FutureProvider<OpenFoodFactsRepository>(
  (ref) async {
    final service = await ref.watch(_openFoodFactsServiceProvider.future);

    return OpenFoodFactsRepository(
      service: service,
    );
  },
);

final adRepositoryProvider = FutureProvider<AdRepository>(
  (ref) async {
    final service = await ref.watch(_adServiceProvider.future);

    return AdRepository(
      service: service,
    );
  },
);

final accessLevelRepositoryProvider =
    FutureProvider<AccessLevelRepository>((ref) async {
  final appConfig = await ref.watch(_appConfigProvider.future);
  final purchaseService = ref.watch(_purchaseServiceProvider);
  final rewardService = ref.watch(_rewardServiceProvider);

  return AccessLevelRepository(
    appConfig: appConfig,
    purchaseService: purchaseService,
    rewardService: rewardService,
  );
});
