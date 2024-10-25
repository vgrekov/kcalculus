import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<bool?> _showConfirmation(BuildContext context, String message) {
  final title = Text(
    MessageType.confirm.displayName,
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
        'Cancel',
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
        'Ok',
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
    messageType.displayName,
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
        'Ok',
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
  confirm(
    displayName: 'Confirmation',
  ),
  info(
    displayName: 'Information',
  ),
  warning(
    displayName: 'Warning',
  ),
  error(
    displayName: 'Error',
  );

  final String displayName;

  const MessageType({
    required this.displayName,
  });
}
