import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/maintenance/tasks/local_storage_database_migration_task.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_state.dart';
import 'package:kcalculus/domain/use_cases/maintenance/tasks/maintenance_task.dart';
import 'package:kcalculus/domain/use_cases/maintenance/tasks/nutrition_facts_previews_creation_task.dart';
import 'package:kcalculus/domain/use_cases/maintenance/tasks/usda_db_migration_task.dart';
import 'package:kcalculus/domain/use_cases/maintenance/tasks/usda_food_data_loading_task.dart';
import 'package:logging/logging.dart';

final _log = Logger('MaintenanceUseCase');

const _kTasks = <MaintenanceTask>[
  LocalStorageDatabaseMigrationTask(),
  UsdaDbMigrationTask(),
  UsdaFoodDataLoadingTask(),
  NutritionFactsPreviewsCreationTask(),
];

class MaintenanceUseCase extends Notifier<MaintenanceState> {
  @override
  MaintenanceState build() => const MaintenanceNotStarted();

  Future<void> run() async {
    if (state is! MaintenanceNotStarted) {
      return;
    }

    _log.info('Maintenance started');

    try {
      for (final task in _kTasks) {
        final shouldRun = await task.shouldRun(ref);
        if (shouldRun) {
          _log.info('[${task.name}] started');

          state = MaintenanceInProgress(
            task: task,
          );

          await task.run(ref);

          _log.info('[${task.name}] complete');
        }
      }

      _log.info('Maintenance complete');

      state = const MaintenanceComplete();
    } catch (error, stackTrace) {
      _log.severe(
        'Maintenance failed',
        error,
        stackTrace,
      );

      state = MaintenanceError(
        error: error,
      );
    }
  }
}
