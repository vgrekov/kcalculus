import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/_common/providers.dart';
import 'package:kcalculus/data/access/repositories/subscription_repository.dart';
import 'package:kcalculus/data/email/services/email_service.dart';
import 'package:kcalculus/domain/_common/models/app_info.dart';
import 'package:kcalculus/domain/_common/models/device_info.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:kcalculus/l10n/app_localizations.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message.dart';
import 'package:kcalculus/ui/common/messaging/services/ui_message_service.dart';
import 'package:kcalculus/ui/providers.dart';
import 'package:logging/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final _log = Logger('PaywallViewModel');

class PaywallViewModel extends AsyncNotifier<SubscriptionState> {
  @override
  FutureOr<SubscriptionState> build() {
    return ref.watch(
      subscriptionRepositoryProvider.selectAsync(
        (it) => it,
      ),
    );
  }

  Future<bool> contactSupportOnPurchaseError(
    String appUserId,
    PurchasesError error,
  ) async {
    _log.finer('contactSupportOnPurchaseError() START');

    try {
      final launched = await _contactSupport(
        appUserId,
        error,
        (l10n) => l10n.supportEmailPurchaseFailedSubject,
        (appInfo, deviceInfo, l10n) => l10n.supportEmailPurchaseFailedBody(
          appUserId,
          error.code.toString(),
          error.message,
          appInfo.version,
          appInfo.buildNumber,
          deviceInfo.platform.name,
          deviceInfo.systemVersion,
          deviceInfo.model,
        ),
      );

      return launched;
    } finally {
      _log.finer('contactSupportOnPurchaseError() END');
    }
  }

  Future<bool> contactSupportOnPurchaseRestoreError(
    String appUserId,
    PurchasesError error,
  ) async {
    _log.finer('contactSupportOnPurchaseRestoreError() START');

    try {
      final launched = _contactSupport(
        appUserId,
        error,
        (l10n) => l10n.supportEmailPurchaseRestoreFailedSubject,
        (appInfo, deviceInfo, l10n) =>
            l10n.supportEmailPurchaseRestoreFailedBody(
              appUserId,
              error.code.toString(),
              error.message,
              appInfo.version,
              appInfo.buildNumber,
              deviceInfo.platform.name,
              deviceInfo.systemVersion,
              deviceInfo.model,
            ),
      );

      return launched;
    } finally {
      _log.finer('contactSupportOnPurchaseRestoreError() END');
    }
  }

  Future<bool> _contactSupport(
    String appUserId,
    PurchasesError error,
    String Function(AppLocalizations l10n) subject,
    String Function(
      AppInfo appInfo,
      DeviceInfo deviceInfo,
      AppLocalizations l10n,
    )
    body,
  ) async {
    _log.finer('_contactSupport() START');

    final l10n = ref.read(l10nProvider);

    try {
      final appInfo = await ref.read(appInfoProvider.future);
      final deviceInfo = await ref.read(deviceInfoProvider.future);

      final launched = await ref
          .read(emailServiceProvider.notifier)
          .composeEmail(
            to: l10n.supportEmailAddress,
            subject: subject(l10n),
            body: body(appInfo, deviceInfo, l10n),
          );

      if (launched) {
        _log.finer('_contactSupport() Email client launched');
      } else {
        _log.severe(
          '_contactSupport() Email client didn\'t launch',
        );

        ref.sendUiMessage(UiNotification(text: l10n.messageUnknownError));
      }

      return launched;
    } catch (error, stackTrace) {
      _log.severe('Failed to contact support', error, stackTrace);

      ref.sendUiMessage(UiNotification(text: l10n.messageUnknownError));

      return false;
    } finally {
      _log.finer('_contactSupport() END');
    }
  }
}

final paywallViewModel =
    AsyncNotifierProvider<PaywallViewModel, SubscriptionState>(
      PaywallViewModel.new,
    );
