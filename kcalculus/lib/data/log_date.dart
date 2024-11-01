import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogDateNotifier extends Notifier<DateTime> {
  Timer? _timer;

  @override
  DateTime build() {
    _scheduleNextDaySwitch();

    ref.onDispose(() {
      _timer?.cancel();
    });

    return DateTime.now();
  }

  void selectDate(DateTime date) {
    state = date;
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
    if (now.year == state.year &&
        now.month == state.month &&
        now.day == state.day + 1) {
      state = now;
    }
    _scheduleNextDaySwitch();
  }
}

final logDateProvider = NotifierProvider<LogDateNotifier, DateTime>(
  LogDateNotifier.new,
);
