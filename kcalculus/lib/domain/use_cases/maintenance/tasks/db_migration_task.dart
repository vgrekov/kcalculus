import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/use_cases/maintenance/tasks/maintenance_task.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

class DbMigrationTask implements MaintenanceTask {
  const DbMigrationTask();

  @override
  String get name => 'DB Migration';

  @override
  String localName(AppLocalizations l10n) =>
      l10n.maintenanceTaskDbMigrationTitle;

  @override
  FutureOr<bool> shouldRun(Ref ref) => DatabaseService.isMigrationRequired();

  @override
  FutureOr<void> run(Ref ref) => DatabaseService.migrateDatabase();
}
