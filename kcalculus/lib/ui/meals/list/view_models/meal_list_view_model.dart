import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/meals/list/view_models/meal_list_ui_state.dart';

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
    await ref.read(mealRepositoryProvider).save(meal);
  }

  Future<void> deleteMeal(String id) async {
    try {
      final deleted = await ref.read(mealRepositoryProvider).delete(id);

      if (deleted) {
        _commander!.send<String, void>(
          MealListCommand.showDeletionSuccessNotification,
          payload: id,
        );
      } else {
        _commander!.send(MealListCommand.showDeletionFailureNotification);
      }
    } catch (error) {
      print(error);
      _commander!.send(MealListCommand.showUnknownErrorNotification);
    }
  }

  Future<void> restoreMeal(String id) async {
    try {
      await ref.read(mealRepositoryProvider).restore(id);
    } catch (error) {
      print(error);
      _commander!.send(MealListCommand.showUnknownErrorNotification);
    }
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
