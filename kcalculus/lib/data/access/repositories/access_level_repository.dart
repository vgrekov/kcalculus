import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/models/purchase_status.dart';
import 'package:kcalculus/data/access/services/purchase_service.dart';
import 'package:kcalculus/data/access/services/reward_service.dart';
import 'package:kcalculus/data/app_config/services/app_config_service.dart';
import 'package:kcalculus/domain/models/access_level.dart';

class AccessLevelRepository extends AsyncNotifier<AccessLevel> {
  @override
  FutureOr<AccessLevel> build() async {
    ref.watch(appConfigServiceProvider);
    ref.watch(purchaseServiceProvider);
    ref.watch(rewardServiceProvider);

    final purchaseStatus = await ref.read(purchaseServiceProvider.future);

    if (purchaseStatus == PurchaseStatus.purchased) {
      return const AccessLevelPremium();
    }

    final appConfig = await ref.read(appConfigServiceProvider.future);

    if (appConfig == null) {
      return const AccessLevelFreeNoAds();
    }

    if (!appConfig.adsEnabled) {
      return const AccessLevelPremium();
    }

    final unlockEndDate = await ref.read(rewardServiceProvider.future);
    if (unlockEndDate != null) {
      return AccessLevelAdSupportedPremium(unlockEndDate);
    }

    return const AccessLevelFree();
  }

  Future<DateTime> rewardUnlock() async {
    final appConfig = await ref.read(appConfigServiceProvider.future);

    if (appConfig == null) {
      throw StateError('Unable to reward unlock due to no app config');
    }

    final rewardService = ref.read(rewardServiceProvider.notifier);

    final rewardDuration = Duration(
      minutes: appConfig.unlockWithAdDurationMins,
    );

    final unlockEnd = await rewardService.rewardUnlockFor(rewardDuration);

    return unlockEnd;
  }
}

final accessLevelRepositoryProvider =
    AsyncNotifierProvider<AccessLevelRepository, AccessLevel>(
  AccessLevelRepository.new,
);
