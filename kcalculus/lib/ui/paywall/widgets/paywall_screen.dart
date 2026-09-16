import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_dialog_type.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message_action.dart';
import 'package:kcalculus/ui/common/messaging/services/ui_message_service.dart';
import 'package:kcalculus/ui/paywall/view_models/paywall_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

final _log = Logger('PaywallScreen');

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  void _onPurchaseCompleted(
    BuildContext context,
    WidgetRef ref,
    CustomerInfo customerInfo,
    StoreTransaction storeTransaction,
  ) {
    _log.eventPurchaseCompleted();

    ref.sendUiMessage(
      UiNotification(
        text: l10n(context).messagePurchaseCompleted,
      ),
    );
  }

  void _onPurchaseError(
    BuildContext context,
    WidgetRef ref,
    String appUserId,
    PurchasesError error,
  ) async {
    _log.severe('Purchase failed for: $appUserId', error);

    final contactSupport = await ref.sendUiMessage<bool>(
      UiDialog(
        text: l10n(context).messagePurchaseFailed,
        type: UiDialogType.error,
        actions: [
          UiMessageAction(
            label: (l10n) => l10n.actionContactSupport,
            callback: (_, _) => true,
          ),
          UiMessageAction(
            label: (l10n) => l10n.actionOk,
            callback: (_, _) => false,
          ),
        ],
      ),
    );

    if (context.mounted && contactSupport == true) {
      ref
          .read(paywallViewModel.notifier)
          .contactSupportOnPurchaseError(appUserId, error);
    }
  }

  void _onRestoreCompleted(
    BuildContext context,
    WidgetRef ref,
    CustomerInfo customerInfo,
  ) {
    bool withEntitlement = customerInfo.entitlements.active.isNotEmpty;

    _log.eventPurchaseRestoreCompleted(withEntitlement);

    final text = withEntitlement
        ? l10n(context).messagePurchaseRestoreCompletedWithEntitlement
        : l10n(context).messagePurchaseRestoreCompletedNoEntitlement;

    ref.sendUiMessage(UiNotification(text: text));
  }

  void _onRestoreError(
    BuildContext context,
    WidgetRef ref,
    String appUserId,
    PurchasesError error,
  ) async {
    _log.severe('Purchase restore failed for: $appUserId', error);

    final contactSupport = await ref.sendUiMessage<bool>(
      UiDialog(
        text: l10n(context).messagePurchaseRestoreFailed,
        type: UiDialogType.error,
        actions: [
          UiMessageAction(
            label: (l10n) => l10n.actionContactSupport,
            callback: (_, _) => true,
          ),
          UiMessageAction(
            label: (l10n) => l10n.actionOk,
            callback: (_, _) => false,
          ),
        ],
      ),
    );

    if (context.mounted && contactSupport == true) {
      ref
          .read(paywallViewModel.notifier)
          .contactSupportOnPurchaseRestoreError(appUserId, error);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(paywallViewModel);

    return Scaffold(
      body: stateAsync.when(
        data: (state) => Center(
          child: PaywallView(
            onPurchaseCompleted: (customerInfo, storeTransaction) {
              _onPurchaseCompleted(
                context,
                ref,
                customerInfo,
                storeTransaction,
              );
            },
            onPurchaseError: (error) {
              _onPurchaseError(context, ref, state.appUserId, error);
            },
            onRestoreCompleted: (customerInfo) {
              _onRestoreCompleted(context, ref, customerInfo);
            },
            onRestoreError: (error) {
              _onRestoreError(context, ref, state.appUserId, error);
            },
          ),
        ),
        error: (error, stackTrace) {
          _log.severe('Failed to load subscription state', error, stackTrace);
          return Center(
            child: Text(
              l10n(context).messageUnknownError,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        },
        loading: () => const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
