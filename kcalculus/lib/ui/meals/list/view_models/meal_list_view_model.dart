import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/ui/meals/list/view_models/meal_list_ui_state.dart';

class MealListViewModel extends Notifier<MealListUiState> {
  Timer? _timer;

  @override
  MealListUiState build() {
    _scheduleNextDaySwitch();

    ref.onDispose(() {
      _timer?.cancel();
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

  Future<Meal> saveMeal(Meal meal) {
    final result = ref.read(mealRepositoryProvider).save(meal);
    _refresh();
    return result;
  }

  Future<bool> deleteMeal(String id) {
    final result = ref.read(mealRepositoryProvider).delete(id);
    _refresh();
    return result;
  }

  Future<bool> restoreMeal(String id) {
    final result = ref.read(mealRepositoryProvider).restore(id);
    _refresh();
    return result;
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
