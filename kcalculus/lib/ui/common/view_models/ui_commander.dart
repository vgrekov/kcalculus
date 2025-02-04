import 'dart:async';
import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';

class UiCommander<Command> {
  UiCommander([UiCommander<Command>? prev]) {
    if (prev != null) {
      _buffer.addAll(prev._buffer);
    }
  }

  final _commandController = StreamController<UiCommand>();

  final _buffer = Queue<UiCommand>();

  bool _isListenedTo = false;

  late final provider = StreamProvider<UiCommand>(
    (ref) {
      ref.onAddListener(_onAddListener);
      ref.onRemoveListener(_onRemoveListener);

      return _commandController.stream;
    },
  );

  Future<Result> send<Payload, Result>(
    Command type, {
    Payload? payload,
  }) {
    final command = UiCommand<Command, Payload, Result>(
      type,
      payload: payload,
    );

    if (_isListenedTo) {
      _commandController.add(command);
    } else {
      _buffer.add(command);
    }

    return command.future;
  }

  void dispose() {
    _commandController.close();
  }

  void _onAddListener() {
    _isListenedTo = true;

    while (_buffer.isNotEmpty) {
      _commandController.add(_buffer.removeFirst());
    }
  }

  void _onRemoveListener() {
    _isListenedTo = false;
  }
}
