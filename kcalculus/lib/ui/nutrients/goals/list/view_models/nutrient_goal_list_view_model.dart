import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('NutrientGoalListViewModel');

enum NutrientGoalListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class NutrientGoalListViewModel
    extends AutoDisposeAsyncNotifier<List<NutrientGoal>> {
  UiCommander<NutrientGoalListCommand>? _commander;

  @override
  FutureOr<List<NutrientGoal>> build() async {
    final nutrientGoalRepository = ref.watch(nutrientGoalRepositoryProvider);

    _commander = UiCommander<NutrientGoalListCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return nutrientGoalRepository.getActiveGoals(DateTime.now());
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> saveGoal(NutrientGoal goal) async {
    _log.finer('saveGoal() START');

    try {
      _log.finest('saveGoal() Saving nutrient goal: $goal');

      await ref.read(nutrientGoalRepositoryProvider).save(goal);

      _log.info('Nutrient goal saved for: ${goal.nutrient}');
      _log.eventNutrientGoalAdd(goal.nutrient);

      await _reload();
    } catch (error, stackTrace) {
      _log.severe('Failed to save nutrient goal', error, stackTrace);

      _commander!.send(NutrientGoalListCommand.showUnknownErrorNotification);
    }

    _log.finer('saveGoal() END');
  }

  Future<void> deleteGoal(NutrientGoal goal) async {
    _log.finer('deleteGoal() START');

    try {
      _log.finest('deleteGoal() Deleting nutrient goal: $goal');

      final result =
          await ref.read(nutrientGoalRepositoryProvider).delete(goal.id!);

      _log.info('Nutrient goal deleted for: ${goal.nutrient}');
      _log.eventNutrientGoalDelete(goal.nutrient);

      await _reload();

      if (result) {
        _commander!.send<NutrientGoal, void>(
          NutrientGoalListCommand.showDeletionSuccessNotification,
          payload: goal,
        );
      } else {
        _commander!
            .send(NutrientGoalListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to delete nutrient goal', error, stackTrace);

      _commander!.send(NutrientGoalListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteGoal() END');
  }

  Future<void> restoreGoal(NutrientGoal goal) async {
    _log.finer('restoreGoal() START');

    try {
      _log.finest('restoreGoal() Restoring nutrient goal: $goal');

      await ref.read(nutrientGoalRepositoryProvider).restore(goal.id!);

      _log.info('Nutrient goal restored for: ${goal.nutrient}');
      _log.eventNutrientGoalRestore(goal.nutrient);

      await _reload();
    } catch (error, stackTrace) {
      _log.severe('Failed to restore default nutrient', error, stackTrace);

      _commander!.send(NutrientGoalListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreGoal() END');
  }

  Future<void> _reload() async {
    state = await AsyncValue.guard(
      () => ref
          .read(nutrientGoalRepositoryProvider)
          .getActiveGoals(DateTime.now()),
    );
  }
}

final nutrientGoalListViewModel = AsyncNotifierProvider.autoDispose<
    NutrientGoalListViewModel, List<NutrientGoal>>(
  NutrientGoalListViewModel.new,
);
