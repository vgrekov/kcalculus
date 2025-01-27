import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';

mixin UiCommander<Command> {
  final _commandController = StreamController<UiCommand>();

  late final commandProvider = StreamProvider<UiCommand>(
    (ref) => _commandController.stream,
  );

  Future<Result> sendCommand<Payload, Result>(
    Command type, {
    Payload? payload,
  }) {
    final command = UiCommand<Command, Payload, Result>(
      type,
      payload: payload,
    );
    _commandController.add(command);
    return command.future;
  }

  void dispose() {
    _commandController.close();
  }
}
