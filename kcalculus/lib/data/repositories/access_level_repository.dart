import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/access_level.dart';

class AccessLevelRepository extends AsyncNotifier<AccessLevel> {
  Timer? _rewardExpirer;

  @override
  FutureOr<AccessLevel> build() {
    ref.watch(appConfigProvider);
    ref.watch(purchaseServiceProvider);
    ref.watch(rewardServiceProvider);

    ref.onDispose(() {
      _rewardExpirer?.cancel();
    });

    return _getAccessLevel().then((accessLevel) {
      if (accessLevel is AccessLevelAdSupportedPremium) {
        final rewardDuration =
            accessLevel.expirationDate.difference(DateTime.now());
        _scheduleRewardExpiration(rewardDuration);
      }

      return accessLevel;
    });
  }

  Future<AccessLevel> _getAccessLevel() async {
    final appConfig = await ref.watch(appConfigProvider.future);
    final purchaseService = ref.watch(purchaseServiceProvider);
    final rewardService = ref.watch(rewardServiceProvider);

    final isPurchased = await purchaseService.isPurchased();

    if (isPurchased) {
      return const AccessLevelPremium();
    }

    final rewardDate = await rewardService.getRewardDate();
    if (rewardDate != null) {
      final expirationDate = rewardDate.add(
        Duration(
          minutes: appConfig.unlockWithAdDurationMins,
        ),
      );
      if (expirationDate.isAfter(DateTime.now())) {
        return AccessLevelAdSupportedPremium(expirationDate);
      }
    }

    return const AccessLevelFree();
  }

  Future<DateTime> rewardUnlock() async {
    final appConfig = await ref.watch(appConfigProvider.future);
    final rewardService = ref.watch(rewardServiceProvider);

    final unlockStart = await rewardService.reward();

    final rewardDuration = Duration(
      minutes: appConfig.unlockWithAdDurationMins,
    );

    final unlockEnd = unlockStart.add(rewardDuration);

    state = AsyncData(AccessLevelAdSupportedPremium(unlockEnd));

    _scheduleRewardExpiration(rewardDuration);

    return unlockEnd;
  }

  void _scheduleRewardExpiration(Duration duration) {
    _rewardExpirer?.cancel();
    _rewardExpirer = Timer(
      duration.isNegative ? Duration.zero : duration,
      () async {
        state = await AsyncValue.guard(_getAccessLevel);
      },
    );
  }
}
