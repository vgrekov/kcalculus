import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/services/subscription_service.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:logging/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final _log = Logger('SubscriptionRepository');

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
      DateTime? expirationDate;
      if (entitlementInfo.expirationDate != null) {
        try {
          expirationDate = DateTime.parse(entitlementInfo.expirationDate!);
        } catch (error, stackTrace) {
          _log.severe(
            'Failed to parse RevenueCat subscription expiration date',
            error,
            stackTrace,
          );
        }
      }

      return SubscriptionActive(
        appUserId: appUserId,
        isTrial: entitlementInfo.periodType == PeriodType.trial,
        expirationDate: expirationDate,
      );
    }

    return SubscriptionInactive(appUserId: appUserId);
  }
}

final subscriptionRepositoryProvider =
    AsyncNotifierProvider<SubscriptionRepository, SubscriptionState>(
      SubscriptionRepository.new,
    );
