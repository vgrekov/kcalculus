import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/maintenance_task.dart';

final maintenanceTaskRepository = FutureProvider<List<MaintenanceTask>>(
  (ref) async {
    final tasks = <MaintenanceTask>[
      // DB Migration
      MaintenanceTask(
        title: (loc) => loc.maintenanceTaskDbMigrationTitle,
        shouldRun: (ref) => DatabaseService.isMigrationRequired(),
        run: (ref) => DatabaseService.migrateDatabase(),
      ),
    ];

    final tasksToRun = <MaintenanceTask>[];

    for (final task in tasks) {
      if (await task.shouldRun(ref)) {
        tasksToRun.add(task);
      }
    }

    return tasksToRun;
  },
);
