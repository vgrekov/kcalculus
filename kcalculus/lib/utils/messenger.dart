import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kcalculus/utils/l10n.dart';

Future<bool?> _showConfirmation(BuildContext context, String message) {
  final title = Text(
    MessageType.confirm.localName(context),
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

  final actions = [
    TextButton(
      onPressed: () {
        Navigator.of(context).pop(false);
      },
      child: Text(
        l10n(context).actionCancel,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
    ),
    TextButton(
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: Text(
        l10n(context).actionOk,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
    ),
  ];

  if (Platform.isIOS) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }

  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}

void _showMessage(
    BuildContext context, String message, MessageType messageType) {
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

  final actions = [
    TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        l10n(context).actionOk,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
    ),
  ];

  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }
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
}

mixin StateMessenger<T extends StatefulWidget> on State<T> {
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
