part of '../providers.dart';

// Services

class _DatabaseServiceNotifier extends AutoDisposeNotifier<DatabaseService>
    implements DatabaseManager {
  @override
  DatabaseService build() {
    final db = ref.watch(localStorageServiceProvider.future);

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
        database: ref.read(localStorageServiceProvider.future),
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
        database: ref.read(localStorageServiceProvider.future),
      );
    }
  }
}

final _databaseServiceProvider =
    NotifierProvider.autoDispose<_DatabaseServiceNotifier, DatabaseService>(
  _DatabaseServiceNotifier.new,
);
