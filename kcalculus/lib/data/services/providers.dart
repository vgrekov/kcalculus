part of '../providers.dart';

// Services

class _DatabaseServiceNotifier extends AutoDisposeNotifier<DatabaseService>
    implements DatabaseManager {
  @override
  DatabaseService build() {
    final db =
        ref.watch(_db.databaseServiceProvider(kLocalStorageDbConfig).future);

    final dbService = DatabaseService(
      database: db,
    );

    ref.onDispose(() {
      dbService.dispose();
    });

    return dbService;
  }

  @override
  FutureOr<File> exportDatabase() async {
    try {
      await state.dispose();

      return DatabaseService.exportDatabase();
    } finally {
      state = DatabaseService(
        database: ref.read(
          _db.databaseServiceProvider(kLocalStorageDbConfig).future,
        ),
      );
    }
  }

  @override
  FutureOr<void> importDatabase(File fromFile) async {
    try {
      await state.dispose();

      await DatabaseService.importDatabase(fromFile);
    } finally {
      state = DatabaseService(
        database: ref.read(
          _db.databaseServiceProvider(kLocalStorageDbConfig).future,
        ),
      );
    }
  }
}

final _databaseServiceProvider =
    NotifierProvider.autoDispose<_DatabaseServiceNotifier, DatabaseService>(
  _DatabaseServiceNotifier.new,
);

final _openFoodFactsServiceProvider = FutureProvider<OpenFoodFactsService>(
  (ref) async {
    final appConfig = await ref.watch(appConfigServiceProvider.future);
    final packageInfo = await PackageInfo.fromPlatform();

    return OpenFoodFactsService(
      appName: packageInfo.appName,
      version: packageInfo.version,
      httpClient: http.Client(),
      appConfig: appConfig,
    );
  },
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
