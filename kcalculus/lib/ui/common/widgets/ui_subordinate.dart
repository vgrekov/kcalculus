import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';

typedef UiAssignment = void Function(UiCommand);

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
    AsyncValue<UiCommand>? prev,
    AsyncValue<UiCommand> next,
  ) {
    if (next is AsyncData) {
      final command = next.value!;
      if (command.type is Type) {
        if (assignments != null) {
          assignments![command.type]?.call(command);
        } else if (onCommand != null) {
          onCommand!.call(command);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(commandProvider, _onUiCommand);

    return child;
  }
}
