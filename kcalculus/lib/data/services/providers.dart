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
