import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/domain/exceptions/localized_exception.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

class LocalStorageDatabaseMigrationTask implements MaintenanceTask {
  const LocalStorageDatabaseMigrationTask();

  @override
  String get name => 'Local Storage Database Migration';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskDbMigrationTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) async {
    try {
      // Waiting for DB to open to avoid StateError
      await ref.read(localStorageServiceProvider.future);

      final dbService = ref.read(localStorageServiceProvider.notifier);

      return dbService.isDatabaseMigrationRequired();
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskDbMigrationFailedMessage,
        cause: error,
      );
    }
  }

  @override
  FutureOr<void> run(Ref ref) async {
    try {
      // Waiting for DB to open to avoid StateError
      await ref.read(localStorageServiceProvider.future);

      final dbService = ref.read(localStorageServiceProvider.notifier);

      return dbService.migrateDatabase();
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskDbMigrationFailedMessage,
        cause: error,
      );
    }
  }
}
