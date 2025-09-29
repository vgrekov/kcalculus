import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/utils/datetime.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RewardService extends AsyncNotifier<DateTime?> {
  static const _kUnlockEndDate = 'unlockEndDate';

  Timer? _rewardExpirer;

  @override
  FutureOr<DateTime?> build() async {
    ref.onDispose(() {
      _rewardExpirer?.cancel();
    });

    final now = DateTime.now();
    final unlockEndDate = await _getUnlockEndDate();
    if (unlockEndDate?.isAfter(now) ?? false) {
      _scheduleRewardExpiration(unlockEndDate!.difference(now));
    }

    return unlockEndDate;
  }

  Future<DateTime> rewardUnlockFor(Duration duration) async {
    final unlockStartDate = DateTime.now();

    final unlockEndDate = unlockStartDate.add(duration);

    final prefs = await SharedPreferences.getInstance();

    prefs.setString(_kUnlockEndDate, formatISO8601(unlockEndDate));

    state = AsyncData(unlockEndDate);

    _scheduleRewardExpiration(duration);

    return unlockEndDate;
  }

  Future<DateTime?> _getUnlockEndDate() async {
    final prefs = await SharedPreferences.getInstance();

    final unlockEndDateStr = prefs.getString(_kUnlockEndDate);

    final unlockEndDate =
        unlockEndDateStr != null ? parseISO8601(unlockEndDateStr) : null;

    return unlockEndDate?.isAfter(DateTime.now()) ?? false
        ? unlockEndDate
        : null;
  }

  void _scheduleRewardExpiration(Duration duration) {
    _rewardExpirer?.cancel();
    _rewardExpirer = Timer(
      duration.isNegative ? Duration.zero : duration,
      () async {
        state = await AsyncValue.guard(_getUnlockEndDate);
      },
    );
  }
}

final rewardServiceProvider = AsyncNotifierProvider<RewardService, DateTime?>(
  RewardService.new,
);
