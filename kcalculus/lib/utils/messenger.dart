import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kcalculus/utils/l10n.dart';

Future<T?> _showMessageDialog<T>({
  required BuildContext context,
  required String message,
  required Map<String, T? Function()> actions,
  required MessageType messageType,
}) {
  final title = Text(
    messageType.localName(context),
    style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
  );

  final content = Text(
    message,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
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
              color: Theme.of(context).colorScheme.onSecondaryContainer,
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

Future<bool?> _showConfirmation(BuildContext context, String message) {
  return _showMessageDialog<bool>(
    context: context,
    message: message,
    actions: {
      l10n(context).actionCancel: () => false,
      l10n(context).actionOk: () => true,
    },
    messageType: MessageType.confirm,
  );
}

void _showMessage(
    BuildContext context, String message, MessageType messageType) {
  _showMessageDialog<void>(
    context: context,
    message: message,
    actions: {
      l10n(context).actionOk: () {},
    },
    messageType: messageType,
  );
}

void _showNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

mixin Messenger {
  Future<bool?> showConfirmation(BuildContext context, String message) async {
    if (context.mounted) {
      return _showConfirmation(context, message);
    }

    return false;
  }

  void showMessage(
      BuildContext context, String message, MessageType messageType) {
    if (context.mounted) {
      return _showMessage(context, message, messageType);
    }
  }

  void showNotification(BuildContext context, String message) {
    if (context.mounted) {
      _showNotification(context, message);
    }
  }

  Future<T?> showMessageDialog<T>({
    required BuildContext context,
    required String message,
    required Map<String, T? Function()> actions,
    required MessageType messageType,
  }) async {
    if (context.mounted) {
      return _showMessageDialog(
        context: context,
        message: message,
        actions: actions,
        messageType: messageType,
      );
    }

    return null;
  }
}

mixin StateMessenger<W extends StatefulWidget> on State<W> {
  Future<bool?> showConfirmation(String message) async {
    if (mounted) {
      return _showConfirmation(context, message);
    }

    return false;
  }

  void showMessage(String message, MessageType messageType) {
    if (mounted) {
      return _showMessage(context, message, messageType);
    }
  }

  void showNotification(String message) {
    if (mounted) {
      _showNotification(context, message);
    }
  }

  Future<T?> showMessageDialog<T>({
    required String message,
    required Map<String, T? Function()> actions,
    required MessageType messageType,
  }) async {
    if (mounted) {
      return _showMessageDialog(
        context: context,
        message: message,
        actions: actions,
        messageType: messageType,
      );
    }

    return null;
  }
}

enum MessageType {
  confirm,
  info,
  warning,
  error;

  String localName(BuildContext context) {
    return switch (this) {
      confirm => l10n(context).messageTypeConfirm,
      info => l10n(context).messageTypeInfo,
      warning => l10n(context).messageTypeWarning,
      error => l10n(context).messageTypeError,
    };
  }
}
