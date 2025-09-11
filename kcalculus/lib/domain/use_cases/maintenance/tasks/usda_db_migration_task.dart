import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/services/usda/usda_service.dart';
import 'package:kcalculus/domain/use_cases/maintenance/tasks/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

class UsdaDbMigrationTask implements MaintenanceTask {
  const UsdaDbMigrationTask();

  @override
  String get name => 'USDA DB Migration';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskUsdaDbMigrationTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) => UsdaService.isMigrationRequired();

  @override
  FutureOr<void> run(Ref ref) => UsdaService.migrateDatabase();
}
