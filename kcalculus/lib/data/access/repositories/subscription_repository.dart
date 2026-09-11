import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/converters/subscription_state_converter.dart';
import 'package:kcalculus/data/access/services/subscription_service.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionRepository extends AsyncNotifier<SubscriptionState> {
  static const _kEntitlementId = 'premium';

  Timer? _timer;

  @override
  FutureOr<SubscriptionState> build() async {
    final customerInfo = await ref.watch(
      subscriptionServiceProvider.future,
    );

    final converter = ref.watch(subscriptionStateConverterProvider.notifier);

    ref.onDispose(() {
      _timer?.cancel();
    });

    final appUserId = await Purchases.appUserID;

    final subscriptionState = converter.toModel(
      customerInfo,
      entitlementId: _kEntitlementId,
      appUserId: appUserId,
    );

    if (subscriptionState is SubscriptionActive &&
        subscriptionState.expirationDate != null) {
      _scheduleRefreshOnExpiration(subscriptionState.expirationDate!);
    }

    return subscriptionState;
  }

  void _scheduleRefreshOnExpiration(DateTime expirationDate) {
    final now = DateTime.now();
    var durationUntilExpiration = expirationDate.difference(now);
    if (durationUntilExpiration.isNegative) {
      durationUntilExpiration = Duration.zero;
    }

    _timer?.cancel();
    _timer = Timer(
      durationUntilExpiration + const Duration(seconds: 5),
      _refresh,
    );
  }

  void _refresh() {
    ref.read(subscriptionServiceProvider.notifier).refresh();
  }
}

final subscriptionRepositoryProvider =
    AsyncNotifierProvider<SubscriptionRepository, SubscriptionState>(
      SubscriptionRepository.new,
    );
