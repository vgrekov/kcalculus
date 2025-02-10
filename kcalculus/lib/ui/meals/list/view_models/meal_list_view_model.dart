import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/meals/list/view_models/meal_list_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('MealListViewModel');

enum MealListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class MealListViewModel extends Notifier<MealListUiState> {
  Timer? _timer;

  UiCommander<MealListCommand>? _commander;

  @override
  MealListUiState build() {
    ref.watch(foodChangesProvider);
    ref.watch(dishChangesProvider);
    ref.watch(mealChangesProvider);

    _scheduleNextDaySwitch();

    _commander = UiCommander<MealListCommand>(_commander);

    ref.onDispose(() {
      _timer?.cancel();
      _commander!.dispose();
    });

    return _loadFor(stateOrNull?.date ?? DateTime.now());
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void selectDate(DateTime date) {
    state = _loadFor(date);
  }

  void toggleCalendar() {
    state = state.copyWith(
      showCalendar: !state.showCalendar,
    );
  }

  Future<void> saveMeal(Meal meal) async {
    _log.finer('saveMeal() START');

    _log.finest('saveMeal() Saving meal: ${meal.toJson()}');

    meal = await ref.read(mealRepositoryProvider).save(meal);

    _log.info('Meal saved');
    _log.finest('saveMeal() Saved meal ID: ${meal.id}');

    _log.finer('saveMeal() END');
  }

  Future<void> deleteMeal(String id) async {
    _log.finer('deleteMeal() START');

    try {
      _log.finest('deleteMeal() Deleting meal with ID: $id');

      final deleted = await ref.read(mealRepositoryProvider).delete(id);

      _log.info('Meal deleted: $deleted');

      if (deleted) {
        _commander!.send<String, void>(
          MealListCommand.showDeletionSuccessNotification,
          payload: id,
        );
      } else {
        _commander!.send(MealListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to delete meal', error, stackTrace);

      _commander!.send(MealListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteMeal() END');
  }

  Future<void> restoreMeal(String id) async {
    _log.finer('restoreMeal() START');

    try {
      _log.finest('restoreMeal() Restoring meal with ID: $id');

      final restored = await ref.read(mealRepositoryProvider).restore(id);

      _log.info('Meal restored: $restored');
    } catch (error, stackTrace) {
      _log.severe('Failed to restore meal', error, stackTrace);

      _commander!.send(MealListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreMeal() END');
  }

  MealListUiState _loadFor(DateTime date) {
    return MealListUiState(
      date: date,
      meals: ref.read(mealRepositoryProvider).getByDate(date),
      showCalendar: false,
    );
  }

  void _scheduleNextDaySwitch() {
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    final durationUntilMidnight = nextMidnight.difference(now);

    _timer?.cancel();
    _timer = Timer(durationUntilMidnight, _switchToNextDay);
  }

  void _switchToNextDay() {
    final now = DateTime.now();
    if (now.year == state.date.year &&
        now.month == state.date.month &&
        now.day == state.date.day + 1) {
      selectDate(now);
    }
    _scheduleNextDaySwitch();
  }
}

final mealListViewModel = NotifierProvider<MealListViewModel, MealListUiState>(
  () => MealListViewModel(),
);
