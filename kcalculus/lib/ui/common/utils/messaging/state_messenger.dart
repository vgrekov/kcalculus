import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/messaging.dart' as msg;

mixin StateMessenger<W extends StatefulWidget> on State<W> {
  Future<bool?> showConfirmation(String message) async {
    if (mounted) {
      return msg.showConfirmation(context, message);
    }

    return null;
  }

  void showMessage(String message, MessageType messageType) {
    if (mounted) {
      msg.showMessage(context, message, messageType);
    }
  }

  void showNotification(
    String message, {
    Duration? duration,
    SnackBarAction? action,
    void Function(SnackBarClosedReason?)? onClosed,
  }) {
    if (mounted) {
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
    String message, {
    required void Function() undoAction,
    void Function(SnackBarClosedReason?)? onClosed,
  }) {
    if (mounted) {
      msg.showNotificationWithUndo(
        context,
        message,
        undoAction: undoAction,
        onClosed: onClosed,
      );
    }
  }

  Future<T?> showMessageDialog<T>({
    required String message,
    required Map<String, T? Function()> actions,
    required MessageType messageType,
  }) async {
    if (mounted) {
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
