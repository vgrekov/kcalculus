import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/meals/list/view_models/meal_list_ui_state.dart';

enum Command {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class MealListViewModel extends Notifier<MealListUiState>
    with UiCommander<Command> {
  Timer? _timer;

  @override
  MealListUiState build() {
    _scheduleNextDaySwitch();

    ref.onDispose(() {
      _timer?.cancel();
      dispose();
    });

    return _loadFor(DateTime.now());
  }

  void selectDate(DateTime date) {
    state = _loadFor(date);
  }

  void toggleCalendar() {
    state = state.copyWith(
      showCalendar: !state.showCalendar,
    );
  }

  Future<void> saveMeal(Meal meal) async {
    await ref.read(mealRepositoryProvider).save(meal);
    _refresh();
  }

  Future<void> deleteMeal(String id) async {
    try {
      final deleted = await ref.read(mealRepositoryProvider).delete(id);

      _refresh();

      if (deleted) {
        sendCommand<String, void>(
          Command.showDeletionSuccessNotification,
          payload: id,
        );
      } else {
        sendCommand(Command.showDeletionFailureNotification);
      }
    } catch (error) {
      print(error);
      sendCommand(Command.showUnknownErrorNotification);
    }
  }

  Future<void> restoreMeal(String id) async {
    try {
      await ref.read(mealRepositoryProvider).restore(id);
      _refresh();
    } catch (error) {
      print(error);
      sendCommand(Command.showUnknownErrorNotification);
    }
  }

  MealListUiState _loadFor(DateTime date) {
    return MealListUiState(
      date: date,
      meals: ref.read(mealRepositoryProvider).getByDate(date),
      showCalendar: false,
    );
  }

  void _refresh() {
    state = _loadFor(state.date);
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
