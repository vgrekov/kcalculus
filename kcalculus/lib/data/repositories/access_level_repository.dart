import 'dart:async';

import 'package:kcalculus/data/services/app_config/app_config.dart';
import 'package:kcalculus/data/services/purchase/purchase_service.dart';
import 'package:kcalculus/data/services/reward/reward_service.dart';
import 'package:kcalculus/domain/models/access_level.dart';

class AccessLevelRepository {
  const AccessLevelRepository({
    required AppConfig appConfig,
    required PurchaseService purchaseService,
    required RewardService rewardService,
  })  : _appConfig = appConfig,
        _purchaseService = purchaseService,
        _rewardService = rewardService;

  final AppConfig _appConfig;

  final PurchaseService _purchaseService;

  final RewardService _rewardService;

  Future<AccessLevel> getAccessLevel() async {
    final isPurchased = await _purchaseService.isPurchased();

    if (isPurchased) {
      return AccessLevel.premium;
    }

    final rewardDate = await _rewardService.getRewardDate();
    if (rewardDate != null) {
      final rewardDurationMins =
          DateTime.now().difference(rewardDate).inMinutes;
      if (rewardDurationMins <= _appConfig.unlockWithAdDurationMins) {
        return AccessLevel.adSupportedPremium;
      }
    }

    return AccessLevel.free;
  }

  Future<DateTime> rewardUnlock() async {
    final unlockStart = await _rewardService.reward();

    final unlockEnd = unlockStart.add(
      Duration(minutes: _appConfig.unlockWithAdDurationMins),
    );

    return unlockEnd;
  }
}
