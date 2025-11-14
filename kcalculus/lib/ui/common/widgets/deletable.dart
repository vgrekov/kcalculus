import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';

class Deletable extends StatelessWidget with WidgetMessenger {
  const Deletable({
    required Key super.key,
    this.enabled = true,
    required this.confirmMessage,
    this.onDeleted,
    required this.child,
  });

  final bool enabled;

  final String confirmMessage;

  final void Function()? onDeleted;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: enabled && onDeleted != null
          ? DismissDirection.endToStart
          : DismissDirection.none,
      confirmDismiss: (_) => showConfirmation(context, confirmMessage),
      onDismissed: (direction) {
        onDeleted?.call();
      },
      background: Container(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
