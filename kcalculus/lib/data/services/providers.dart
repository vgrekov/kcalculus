part of '../providers.dart';

// Services

class _DatabaseServiceNotifier extends AutoDisposeNotifier<DatabaseService>
    implements DatabaseManager {
  @override
  DatabaseService build() {
    ref.onDispose(() {
      state.dispose();
    });

    return DatabaseService();
  }

  @override
  FutureOr<File> exportDatabase() async {
    try {
      await state.dispose();

      return DatabaseService.exportDatabase();
    } finally {
      state = DatabaseService();
    }
  }

  @override
  FutureOr<void> importDatabase(File fromFile) async {
    try {
      await state.dispose();

      await DatabaseService.importDatabase(fromFile);
    } finally {
      state = DatabaseService();
    }
  }
}

final _databaseServiceProvider =
    NotifierProvider.autoDispose<_DatabaseServiceNotifier, DatabaseService>(
  _DatabaseServiceNotifier.new,
);

final envProvider = AsyncNotifierProvider<EnvService, String?>(
  EnvService.new,
);

final appConfigProvider = AsyncNotifierProvider<AppConfigService, AppConfig?>(
  AppConfigService.new,
);

final _openFoodFactsServiceProvider = FutureProvider<OpenFoodFactsService>(
  (ref) async {
    final appConfig = await ref.watch(appConfigProvider.future);
    final packageInfo = await PackageInfo.fromPlatform();

    return OpenFoodFactsService(
      appName: packageInfo.appName,
      version: packageInfo.version,
      httpClient: http.Client(),
      appConfig: appConfig,
    );
  },
);

final _adServiceProvider = FutureProvider<AdService>(
  (ref) async {
    final appConfig = await ref.watch(appConfigProvider.future);

    return AdService(
      appConfig: appConfig,
    );
  },
);

final purchaseServiceProvider = Provider<PurchaseService>(
  (ref) => const PurchaseService(),
);

final rewardServiceProvider = Provider<RewardService>(
  (ref) => const RewardService(),
);

final _usdaServiceProvider = Provider<UsdaService>(
  (ref) {
    final service = UsdaService();

    ref.onDispose(() {
      service.dispose();
    });

    return service;
  },
);
