import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/access_guard/view_models/access_guard_view_model.dart';
import 'package:kcalculus/ui/access_guard/view_models/premium_status.dart';

void premiumFeature(
  WidgetRef ref,
  Key? accessGuardKey,
  void Function() feature,
) async {
  final premiumStatus = await ref
      .watch(accessGuardViewModel(accessGuardKey).notifier)
      .checkPremiumStatus();

  switch (premiumStatus) {
    case PremiumGranted():
      feature();
      break;
    case PremiumGrantedWithAd(:final ad):
      ad.show(
        onUserEarnedReward: (ad, reward) async {
          ref
              .watch(accessGuardViewModel(accessGuardKey).notifier)
              .rewardPremium();
        },
      );
      break;
    default:
  }
}
