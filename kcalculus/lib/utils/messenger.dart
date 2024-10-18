import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<bool?> _confirm(BuildContext context, String title) {
  final titleWidget = Text(
    title,
    style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
          title: titleWidget,
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
        title: titleWidget,
        actions: actions,
      );
    },
  );
}

void _showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: Text(message),
    ),
  );
}

mixin Messenger {
  Future<bool?> confirm(BuildContext context, String title) async {
    if (context.mounted) {
      return _confirm(context, title);
    }

    return false;
  }

  void showMessage(BuildContext context, String message) {
    if (context.mounted) {
      _showMessage(context, message);
    }
  }
}

mixin StateMessenger<T extends StatefulWidget> on State<T> {
  Future<bool?> confirm(String title) async {
    if (mounted) {
      return _confirm(context, title);
    }

    return false;
  }

  void showMessage(String message) {
    if (mounted) {
      _showMessage(context, message);
    }
  }
}
