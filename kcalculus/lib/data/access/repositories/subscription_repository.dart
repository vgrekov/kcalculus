import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/converters/subscription_state_converter.dart';
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

    final converter = ref.watch(subscriptionStateConverterProvider.notifier);

    final appUserId = await Purchases.appUserID;

    return converter.toModel(
      customerInfo,
      entitlementId: _kEntitlementId,
      appUserId: appUserId,
    );
  }
}

final subscriptionRepositoryProvider =
    AsyncNotifierProvider<SubscriptionRepository, SubscriptionState>(
      SubscriptionRepository.new,
    );
