import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/app_config/services/app_config_service.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
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

      await ref.read(_revenueCatInitProvider.future);

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

final _revenueCatSdkApiKeyProvider = FutureProvider<String?>(
  (ref) async {
    final sdkApiKeyFromEnv = const String.fromEnvironment(
      _kRevenueCatSdkApiKeyArg,
    );

    if (sdkApiKeyFromEnv.isNotEmpty) {
      return sdkApiKeyFromEnv;
    }

    return ref.read(
      appConfigServiceProvider.selectAsync(
        (config) => config?.revenueCat.sdkApiKey,
      ),
    );
  },
);

final _revenueCatInitProvider = FutureProvider<void>(
  (ref) async {
    if (await Purchases.isConfigured) return;

    final sdkApiKey = await ref.read(
      _revenueCatSdkApiKeyProvider.selectAsync(
        (it) => it,
      ),
    );

    if (sdkApiKey?.isNotEmpty != true) {
      throw StateError('No RevenueCat SDK API key provided');
    }

    await Purchases.configure(
      PurchasesConfiguration(sdkApiKey!),
    );
  },
);
