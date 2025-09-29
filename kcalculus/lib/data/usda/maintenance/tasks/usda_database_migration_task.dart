import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/usda/_common/services/usda_service.dart';
import 'package:kcalculus/domain/exceptions/localized_exception.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

class UsdaDatabaseMigrationTask implements MaintenanceTask {
  const UsdaDatabaseMigrationTask();

  @override
  String get name => 'USDA Database Migration';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskUsdaDbMigrationTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) async {
    try {
      // Waiting for DB to open to avoid StateError
      await ref.read(usdaServiceProvider.future);

      final usdaService = ref.read(usdaServiceProvider.notifier);

      return usdaService.isDatabaseMigrationRequired();
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaDbMigrationFailedMessage,
        cause: error,
      );
    }
  }

  @override
  FutureOr<void> run(Ref ref) async {
    try {
      // Waiting for DB to open to avoid StateError
      await ref.read(usdaServiceProvider.future);

      final usdaService = ref.read(usdaServiceProvider.notifier);

      return usdaService.migrateDatabase();
    } catch (error) {
      throw LocalizedException(
        (loc) => loc.maintenanceTaskUsdaDbMigrationFailedMessage,
        cause: error,
      );
    }
  }
}
