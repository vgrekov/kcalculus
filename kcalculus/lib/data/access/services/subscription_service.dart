import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/utils/lifecycle/lifecycle_state_provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

const _kRevenueCatSdkApiKeyArg = 'REVENUE_CAT_SDK_API_KEY';

class SubscriptionService extends AsyncNotifier<CustomerInfo> {
  bool _isListeningToCustomerInfoUpdates = false;

  @override
  FutureOr<CustomerInfo> build() async {
    final CustomerInfo customerInfo;

    try {
      _stopListeningToCustomerInfoUpdates();
      ref.onDispose(_stopListeningToCustomerInfoUpdates);

      await ref.watch(_revenueCatInitProvider.future);
      ref.watch(
        lifecycleStateProvider.select(
          (it) => it.triggers[AppLifecycleState.resumed],
        ),
      );

      final uid = await ref.watch(
        authServiceProvider.selectAsync((user) => user?.uid),
      );

      final revenueCatAppUserId = await Purchases.appUserID;
      final isRevenueCatAnonymous = await Purchases.isAnonymous;

      if (uid != null &&
          (isRevenueCatAnonymous || uid != revenueCatAppUserId)) {
        // New sign in or user switch
        customerInfo = (await Purchases.logIn(uid)).customerInfo;
      } else if (uid == null && !isRevenueCatAnonymous) {
        // Sign out
        customerInfo = await Purchases.logOut();
      } else {
        // Otherwise
        customerInfo = await Purchases.getCustomerInfo();
      }
    } finally {
      listenSelf(
        (_, next) {
          next.whenData(
            (_) => _startListeningToCustomerInfoUpdates(),
          );
        },
      );
    }

    return customerInfo;
  }

  Future<void> refresh() async {
    if (await Purchases.isConfigured) {
      await Purchases.invalidateCustomerInfoCache();
    }

    ref.invalidateSelf();
  }

  void _startListeningToCustomerInfoUpdates() {
    if (_isListeningToCustomerInfoUpdates) return;

    try {
      _isListeningToCustomerInfoUpdates = true;
      Purchases.addCustomerInfoUpdateListener(_onCustomerInfoUpdate);
    } catch (_) {
      _isListeningToCustomerInfoUpdates = false;
      rethrow;
    }
  }

  void _stopListeningToCustomerInfoUpdates() {
    if (!_isListeningToCustomerInfoUpdates) return;

    try {
      _isListeningToCustomerInfoUpdates = false;
      Purchases.removeCustomerInfoUpdateListener(_onCustomerInfoUpdate);
    } catch (_) {
      _isListeningToCustomerInfoUpdates = true;
      rethrow;
    }
  }

  void _onCustomerInfoUpdate(CustomerInfo customerInfoNew) {
    state.maybeWhen(
      data: (customerInfoOld) {
        if (customerInfoNew != customerInfoOld) {
          state = AsyncValue.data(customerInfoNew);
        }
      },
      orElse: () {
        state = AsyncValue.data(customerInfoNew);
      },
    );
  }
}

final subscriptionServiceProvider =
    AsyncNotifierProvider<SubscriptionService, CustomerInfo>(
      SubscriptionService.new,
    );

final _revenueCatInitProvider = FutureProvider<void>(
  (ref) async {
    if (await Purchases.isConfigured) return;

    final sdkApiKey = const String.fromEnvironment(
      _kRevenueCatSdkApiKeyArg,
    );

    if (sdkApiKey.isEmpty) {
      throw StateError('No RevenueCat SDK API key provided');
    }

    await Purchases.configure(
      PurchasesConfiguration(sdkApiKey),
    );
  },
);
