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

final _envProvider = Provider<String>(
  (_) => const String.fromEnvironment('ENV', defaultValue: 'dev'),
);

final appConfigProvider = FutureProvider<AppConfig>(
  (ref) {
    final env = ref.watch(_envProvider);
    final service = LocalAppConfigService(env: env);

    return service.getAppConfig();
  },
);

final _openFoodFactsServiceProvider = FutureProvider<OpenFoodFactsService>(
  (ref) async {
    final appConfig = await ref.watch(appConfigProvider.future);
    final packageInfo = await PackageInfo.fromPlatform();
    return OpenFoodFactsService(
      openFoodFactsBaseUrl: appConfig.openFoodFactsBaseUrl,
      contactEmail: appConfig.contactEmail,
      appName: packageInfo.appName,
      version: packageInfo.version,
      httpClient: http.Client(),
    );
  },
);

final _adServiceProvider = FutureProvider<AdService>(
  (ref) async {
    final appConfig = await ref.watch(appConfigProvider.future);

    return AdService(
      androidInterstitialAdUnitId: appConfig.androidInterstitialAdUnitId,
      iOsInterstitialAdUnitId: appConfig.iOsInterstitialAdUnitId,
      interstitialAdTimeoutMillis: appConfig.interstitialAdTimeoutMillis,
      androidUnlockAdUnitId: appConfig.androidUnlockAdUnitId,
      iOsUnlockAdUnitId: appConfig.iOsUnlockAdUnitId,
      unlockAdTimeoutMillis: appConfig.unlockAdTimeoutMillis,
      interstitialAdCooldownDurationMins:
          appConfig.interstitialAdCooldownDurationMins,
    );
  },
);

final purchaseServiceProvider = Provider<PurchaseService>(
  (ref) => const PurchaseService(),
);

final rewardServiceProvider = Provider<RewardService>(
  (ref) => const RewardService(),
);
