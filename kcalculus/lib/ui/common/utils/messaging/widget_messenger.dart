import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/messaging.dart' as msg;

mixin WidgetMessenger {
  Future<bool?> showConfirmation(
    BuildContext context,
    String message,
  ) async {
    if (context.mounted) {
      return msg.showConfirmation(context, message);
    }

    return null;
  }

  void showMessage(
    BuildContext context,
    String message,
    MessageType messageType,
  ) {
    if (context.mounted) {
      msg.showMessage(context, message, messageType);
    }
  }

  void showNotification(
    BuildContext context,
    String message, {
    Duration? duration,
    SnackBarAction? action,
    void Function(SnackBarClosedReason?)? onClosed,
  }) {
    if (context.mounted) {
      msg.showNotification(
        context,
        message,
        duration: duration,
        action: action,
        onClosed: onClosed,
      );
    }
  }

  void showNotificationWithUndo(
    BuildContext context,
    String message, {
    required void Function() undoAction,
    void Function(SnackBarClosedReason?)? onClosed,
  }) {
    if (context.mounted) {
      msg.showNotificationWithUndo(
        context,
        message,
        undoAction: undoAction,
        onClosed: onClosed,
      );
    }
  }

  Future<T?> showMessageDialog<T>({
    required BuildContext context,
    required String message,
    required Map<String, T? Function()> actions,
    required MessageType messageType,
  }) async {
    if (context.mounted) {
      return msg.showMessageDialog(
        context: context,
        message: message,
        actions: actions,
        messageType: messageType,
      );
    }

    return null;
  }
}
