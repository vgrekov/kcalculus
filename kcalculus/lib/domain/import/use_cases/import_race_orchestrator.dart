import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/user_data/import/repositories/import_repository.dart';
import 'package:kcalculus/data/storage/local/edible/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/local/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/local/meal/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';

class ImportRaceOrchestrator extends Notifier<void> {
  @override
  void build() {
    ref.listen(
      firestoreImportRepositoryProvider,
      _importProcessListener,
      fireImmediately: true,
    );
  }

  void _importProcessListener(
    AsyncValue<ImportProcess>? prev,
    AsyncValue<ImportProcess> next,
  ) {
    next.whenData(
      (data) async {
        if (data is ImportProcessIdle && await _isLocalDbNotEmpty()) {
          ref
              .read(firestoreImportRepositoryProvider.notifier)
              .provisionImport();
        }
      },
    );
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
