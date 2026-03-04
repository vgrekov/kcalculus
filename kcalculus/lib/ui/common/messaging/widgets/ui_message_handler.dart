import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message.dart';
import 'package:kcalculus/ui/common/messaging/services/ui_message_service.dart';
import 'package:kcalculus/utils/l10n.dart';

class UiMessageHandler extends ConsumerStatefulWidget {
  const UiMessageHandler({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UiMessageHandlerState();
}

class _UiMessageHandlerState extends ConsumerState<UiMessageHandler> {
  late ProviderSubscription<UiMessage?> _subscription;

  @override
  void initState() {
    _subscription = ref.listenManual(
      uiMessageProvider,
      (_, value) {
        _handleMessage(value);
      },
      fireImmediately: true,
    );

    super.initState();
  }

  @override
  void dispose() {
    _subscription.close();

    super.dispose();
  }

  void _handleMessage(UiMessage? message) {
    if (message == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      switch (message) {
        case UiNotification notification:
          _showNotification(
            context,
            ref,
            notification,
          );
          break;
        case UiDialog dialog:
          _showDialog(context, ref, dialog);
          break;
      }
    });
  }

  void _showNotification(
    BuildContext context,
    WidgetRef ref,
    UiNotification notification,
  ) async {
    try {
      ScaffoldMessenger.of(context).clearSnackBars();

      final controller = ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: notification.duration,
          content: Text(
            notification.text,
            textAlign: TextAlign.left,
          ),
          action: notification.action == null
              ? null
              : SnackBarAction(
                  label: notification.action!.label(l10n(context)),
                  onPressed: () async {
                    if (context.mounted) {
                      try {
                        final actionResult = await notification.action!
                            .callback(
                              context,
                              ref,
                            );

                        notification.complete(
                          notification.castActionResult(actionResult),
                        );
                      } catch (error, stackTrace) {
                        notification.completeError(error, stackTrace);
                      }
                    } else {
                      notification.complete(null);
                    }
                  },
                ),
        ),
      );

      await controller.closed;

      notification.complete(null);
    } catch (error, stackTrace) {
      notification.completeError(error, stackTrace);
    }
  }

  void _showDialog(
    BuildContext context,
    WidgetRef ref,
    UiDialog dialog,
  ) {
    try {
      final title = Text(
        dialog.type.localName(l10n(context)),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      );

      final content = Text(
        dialog.text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      );

      final actions = dialog.actions.map((action) {
        return TextButton(
          onPressed: () {
            Navigator.of(context).pop(action.callback(context, ref));
          },
          child: Text(
            action.label(l10n(context)),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      }).toList();

      final actionResult = Platform.isIOS
          ? showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: title,
                  content: content,
                  actions: actions,
                );
              },
            )
          : showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  title: title,
                  content: content,
                  actions: actions,
                );
              },
            );

      dialog.complete(dialog.castActionResult(actionResult));
    } catch (error, stackTrace) {
      dialog.completeError(error, stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
