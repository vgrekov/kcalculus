import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';

typedef UiAssignment = void Function(
  UiCommand commend, {
  required BuildContext context,
  required WidgetRef ref,
});

class UiSubordinate<Type> extends ConsumerWidget {
  UiSubordinate({
    super.key,
    required this.commandProvider,
    this.assignments,
    this.onCommand,
    required this.child,
  }) {
    if (assignments == null && onCommand == null) {
      throw ArgumentError(
          "Either 'assignments' or 'onCommand' must be provided.");
    }

    if (assignments != null && onCommand != null) {
      throw ArgumentError(
          "Only one of 'assignments' or 'onCommand' should be provided.");
    }
  }

  final StreamProvider<UiCommand> commandProvider;

  final Map<Type, UiAssignment>? assignments;

  final void Function(UiCommand)? onCommand;

  final Widget child;

  void _onUiCommand(
    AsyncValue<UiCommand> commandAsync, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    if (commandAsync is AsyncData) {
      final command = commandAsync.value!;
      if (command.type is Type) {
        if (assignments != null) {
          assignments![command.type]?.call(
            command,
            context: context,
            ref: ref,
          );
        } else if (onCommand != null) {
          onCommand!.call(command);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(commandProvider, (prev, next) {
      _onUiCommand(
        next,
        context: context,
        ref: ref,
      );
    });

    return child;
  }
}
