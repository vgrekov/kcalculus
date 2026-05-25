import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/repositories/import_repository.dart';
import 'package:kcalculus/data/storage/local/edible/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/local/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/local/meal/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';
import 'package:kcalculus/domain/maintenance/models/maintenance_state.dart';
import 'package:kcalculus/domain/maintenance/use_cases/maintenance_use_case.dart';

final _importRaceTriggerProvider = FutureProvider<bool>(
  (ref) async {
    final maintenanceState = ref.watch(maintenanceUseCaseProvider);

    final importProcess = await ref.watch(
      firestoreImportRepositoryProvider.selectAsync((data) => data),
    );

    return maintenanceState is MaintenanceComplete &&
        importProcess is ImportProcessIdle;
  },
);

class ImportRaceOrchestrator extends Notifier<void> {
  @override
  void build() {
    ref.listen(
      _importRaceTriggerProvider,
      _importRaceTriggerListener,
      fireImmediately: true,
    );
  }

  void _importRaceTriggerListener(
    AsyncValue<bool>? prev,
    AsyncValue<bool> next,
  ) async {
    final prevValue = prev?.valueOrNull;
    final nextValue = next.valueOrNull;

    if (prevValue == true) return;

    if (nextValue == true && await _isLocalDbNotEmpty()) {
      ref.read(firestoreImportRepositoryProvider.notifier).provisionImport();
    }
  }

  Future<bool> _isLocalDbNotEmpty() async {
    final checks = [
      () => ref.read(localEdibleRepositoryProvider.notifier).isEmpty(),
      () => ref.read(localMealRepositoryProvider.notifier).isEmpty(),
      () => ref.read(localNutrientGoalRepositoryProvider.notifier).isEmpty(),
      () => ref.read(localFoodContainerRepositoryProvider.notifier).isEmpty(),
    ];

    for (final check in checks) {
      final isEmpty = await check();
      if (!isEmpty) {
        return true;
      }
    }

    return false;
  }
}

final importRaceOrchestratorProvider =
    NotifierProvider<ImportRaceOrchestrator, void>(
      ImportRaceOrchestrator.new,
    );
