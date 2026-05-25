import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/utils/l10n.dart';

const _kDefaultNotificationDuration = Duration(milliseconds: 1500);

Future<T?> showMessageDialog<T>({
  required BuildContext context,
  required String message,
  required Map<String, T? Function()> actions,
  required MessageType messageType,
}) {
  final title = Text(
    messageType.localName(context),
    style: Theme.of(context).textTheme.titleMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    ),
  );

  final content = Text(
    message,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    ),
  );

  final actionButtons = actions.entries.map((action) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(action.value());
      },
      child: Text(
        action.key,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }).toList();

  if (Platform.isIOS) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actionButtons,
        );
      },
    );
  }

  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: title,
        content: content,
        actions: actionButtons,
      );
    },
  );
}

Future<bool?> showConfirmation(BuildContext context, String message) {
  return showMessageDialog<bool>(
    context: context,
    message: message,
    actions: {
      l10n(context).actionCancel: () => false,
      l10n(context).actionOk: () => true,
    },
    messageType: MessageType.confirm,
  );
}

void showMessage(
  BuildContext context,
  String message,
  MessageType messageType,
) {
  showMessageDialog<void>(
    context: context,
    message: message,
    actions: {
      l10n(context).actionOk: () {},
    },
    messageType: messageType,
  );
}

void showNotification(
  BuildContext context,
  String message, {
  Duration? duration,
  SnackBarAction? action,
  void Function(SnackBarClosedReason?)? onClosed,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();

  final controller = ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration ?? _kDefaultNotificationDuration,
      content: Text(
        message,
        textAlign: TextAlign.left,
      ),
      action: action,
      persist: false,
    ),
  );

  if (onClosed != null) {
    controller.closed.then(onClosed);
  }
}

void showNotificationWithUndo(
  BuildContext context,
  String message, {
  required void Function() undoAction,
  void Function(SnackBarClosedReason?)? onClosed,
}) {
  showNotification(
    context,
    message,
    action: SnackBarAction(
      label: l10n(context).actionUndo,
      onPressed: undoAction,
    ),
    duration: _kDefaultNotificationDuration * 2,
    onClosed: onClosed,
  );
}
