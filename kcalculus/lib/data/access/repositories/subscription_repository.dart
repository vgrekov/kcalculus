import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/services/subscription_service.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionRepository extends AsyncNotifier<SubscriptionState> {
  static const _kEntitlementId = 'premium';

  @override
  FutureOr<SubscriptionState> build() async {
    final customerInfo = await ref.watch(
      subscriptionServiceProvider.selectAsync(
        (it) => it,
      ),
    );

    final appUserId = await Purchases.appUserID;

    final entitlementInfo = customerInfo.entitlements.all[_kEntitlementId];

    if (entitlementInfo != null && entitlementInfo.isActive) {
      return SubscriptionActive(
        appUserId: appUserId,
        isTrial: entitlementInfo.periodType == PeriodType.trial,
        expirationDate: entitlementInfo.expirationDate,
      );
    }

    return SubscriptionInactive(appUserId: appUserId);
  }
}

final subscriptionRepositoryProvider =
    AsyncNotifierProvider<SubscriptionRepository, SubscriptionState>(
      SubscriptionRepository.new,
    );
