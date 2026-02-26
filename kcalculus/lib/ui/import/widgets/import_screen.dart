import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';
import 'package:kcalculus/domain/import/models/import_state.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message.dart';
import 'package:kcalculus/ui/common/messaging/services/ui_message_service.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/import/view_models/import_view_model.dart';
import 'package:kcalculus/ui/import/widgets/import_booked_view.dart';
import 'package:kcalculus/ui/import/widgets/import_error_view.dart';
import 'package:kcalculus/ui/import/widgets/import_failed_view.dart';
import 'package:kcalculus/ui/import/widgets/import_in_progress_view.dart';
import 'package:kcalculus/ui/import/widgets/import_loading_view.dart';
import 'package:kcalculus/ui/import/widgets/import_remote_view.dart';
import 'package:kcalculus/ui/import/widgets/import_succeeded_view.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final _log = Logger('ImportScreen');

class ImportScreen extends ConsumerWidget with WidgetMessenger {
  ImportScreen({super.key});

  late final _assignments = <ImportCommand, UiAssignment>{
    ImportCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
  };

  void _contactSupport(BuildContext context, WidgetRef ref) {
    ref.read(importViewModel.notifier).contactSupport();
  }

  void _runImport(BuildContext context, WidgetRef ref) async {
    final confirmed = await showMessageDialog<bool>(
      context: context,
      message: l10n(context).messageImportConfirmation,
      actions: {
        l10n(context).actionCancel: () => false,
        l10n(context).actionImport: () => true,
      },
      messageType: MessageType.warning,
    );

    if (confirmed == true && context.mounted) {
      ref.read(importViewModel.notifier).runImport();
    }
  }

  void _declineImport(BuildContext context, WidgetRef ref) {
    ProgressOverlay.wrap(
      context,
      ref.read(importViewModel.notifier).declineImport(),
    );
  }

  void _acknowledgeImport(BuildContext context, WidgetRef ref) {
    ProgressOverlay.wrap(
      context,
      ref.read(importViewModel.notifier).acknowledgeImport(),
    );
  }

  void _retryImport(BuildContext context, WidgetRef ref) async {
    final confirmed = await showConfirmation(
      context,
      l10n(context).messageRetryImportConfirmation,
    );

    if (confirmed == true && context.mounted) {
      ProgressOverlay.wrap(
        context,
        ref.read(importViewModel.notifier).retryImport(),
      );
    }
  }

  void _revertImport(BuildContext context, WidgetRef ref) async {
    final confirmed = await showConfirmation(
      context,
      l10n(context).messageRevertImportConfirmation,
    );

    if (confirmed == true && context.mounted) {
      ProgressOverlay.wrap(
        context,
        ref.read(importViewModel.notifier).revertImport(),
      );
    }
  }

  void _ignoreImport(BuildContext context, WidgetRef ref) async {
    final confirmed = await showConfirmation(
      context,
      l10n(context).messageIgnoreImportConfirmation,
    );

    if (confirmed == true && context.mounted) {
      ProgressOverlay.wrap(
        context,
        ref.read(importViewModel.notifier).ignoreImport(),
      );
    }
  }

  void _logout(BuildContext context, WidgetRef ref) async {
    final confirmed = await ref.sendUiMessage(
      UiDialog.confirm(
        text: l10n(context).messageLogoutConfirmation,
      ),
    );

    if (confirmed == true) {
      await ref.read(importViewModel.notifier).logout();
    }
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(context, l10n(context).messageUnknownError);
    command.complete();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(importViewModel);

    final viewModel = ref.read(importViewModel.notifier);

    return UiSubordinate(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n(context).screenImport,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _contactSupport(context, ref);
              },
              icon: Icon(
                Icons.support_agent,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: stateAsync.when(
            data: (state) => switch (state.importProcess) {
              ImportProcessRemote _ => ImportRemoteView(
                onContactSupport: () {
                  _contactSupport(context, ref);
                },
                onLogout: () {
                  _logout(context, ref);
                },
              ),
              ImportProcessLocalActive process =>
                switch (process.importRecord.state) {
                  ImportState.booked => ImportBookedView(
                    onRunImport: () {
                      _runImport(context, ref);
                    },
                    onDeclineImport: () {
                      _declineImport(context, ref);
                    },
                  ),
                  ImportState.inProgress => ImportInProgressView(
                    isRunning: state.isImportRunning,
                    onContactSupport: () {
                      _contactSupport(context, ref);
                    },
                  ),
                  ImportState.succeeded => ImportSucceededView(
                    report: process.importRecord.report,
                    onDone: () {
                      _acknowledgeImport(context, ref);
                    },
                  ),
                  ImportState.failed => ImportFailedView(
                    onRetryImport: () {
                      _retryImport(context, ref);
                    },
                    onRevertImport: () {
                      _revertImport(context, ref);
                    },
                    onIgnoreImport: () {
                      _ignoreImport(context, ref);
                    },
                  ),
                  _ => const ImportLoadingView(),
                },
              _ => const ImportLoadingView(),
            },
            error: (error, stackTrace) {
              _log.severe('Failed to load import process', error, stackTrace);

              return const ImportErrorView();
            },
            loading: () => const ImportLoadingView(),
          ),
        ),
      ),
    );
  }
}
