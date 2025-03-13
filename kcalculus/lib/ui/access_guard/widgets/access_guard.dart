import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/access_guard/view_models/access_guard_view_model.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';

class AccessGuard extends ConsumerWidget with WidgetMessenger {
  AccessGuard({
    super.key,
    required this.child,
  });

  final Widget child;

  final ProgressOverlay _progressOverlay = ProgressOverlay();

  late final _assignments = <AccessGuardCommand, UiAssignment>{
    AccessGuardCommand.confirmUnlockWithAd: _confirmUnlockWithAd,
    AccessGuardCommand.showUnlockedMessage: _showUnlockedMessage,
    AccessGuardCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
    AccessGuardCommand.showProgress: _showProgress,
    AccessGuardCommand.hideProgress: _hideProgress,
  };

  void _confirmUnlockWithAd(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final confirmed = await showConfirmation(
      context,
      l10n(context).messageUnlockWithAdConfirmation,
    );
    command.complete(confirmed == true);
  }

  void _showUnlockedMessage(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showMessage(
      context,
      l10n(context).messageUnlockedWithAd(
        dt.formatDateTimeLocal(context, command.payload as DateTime),
      ),
      MessageType.info,
    );
    command.complete();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(context, l10n(context).messageUnknownError);
    command.complete();
  }

  void _showProgress(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    _progressOverlay.show(context);
    command.complete();
  }

  void _hideProgress(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    _progressOverlay.hide();
    command.complete();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(accessGuardViewModel(key).notifier);

    return UiSubordinate<AccessGuardCommand>(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: child,
    );
  }
}
