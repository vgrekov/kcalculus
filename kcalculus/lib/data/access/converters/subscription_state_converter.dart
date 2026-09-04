import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:logging/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final _log = Logger('SubscriptionStateConverter');

class SubscriptionStateConverter extends Notifier<void> {
  static DateTime? _parseDateTime(String? str) {
    if (str != null) {
      try {
        return DateTime.parse(str);
      } catch (error, stackTrace) {
        _log.severe(
          'Failed to parse RevenueCat datetime: "$str"',
          error,
          stackTrace,
        );
      }
    }

    return null;
  }

  @override
  void build() {}

  SubscriptionState toModel(
    CustomerInfo customerInfo, {
    required String entitlementId,
    required String appUserId,
  }) {
    final entitlementInfo = customerInfo.entitlements.all[entitlementId];

    if (entitlementInfo != null && entitlementInfo.isActive) {
      return SubscriptionActive(
        appUserId: appUserId,
        isTrial: entitlementInfo.periodType == PeriodType.trial,
        expirationDate: _parseDateTime(entitlementInfo.expirationDate),
      );
    }

    return SubscriptionInactive(appUserId: appUserId);
  }
}

final subscriptionStateConverterProvider =
    NotifierProvider<SubscriptionStateConverter, void>(
      SubscriptionStateConverter.new,
    );
