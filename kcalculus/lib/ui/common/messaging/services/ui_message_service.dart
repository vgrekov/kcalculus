import 'dart:async';
import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message.dart';

class UiMessageService extends Notifier<UiMessage?> {
  final _queue = Queue<UiMessage>();

  @override
  UiMessage? build() {
    return _nextMessage();
  }

  FutureOr<ActionResult?> send<ActionResult>(UiMessage<ActionResult> message) {
    if (message.isCompleted) return message.future;

    _queue.add(message);

    message.future.whenComplete(_goToNextMessage);

    if (_queue.length == 1) {
      state = message;
    }

    return message.future;
  }

  UiMessage? _nextMessage() {
    while (true) {
      final first = _queue.firstOrNull;

      if (first == null || !first.isCompleted) {
        return first;
      }

      _queue.removeFirst();
    }
  }

  void _goToNextMessage() {
    state = _nextMessage();
  }
}

final uiMessageProvider = NotifierProvider<UiMessageService, UiMessage?>(
  UiMessageService.new,
);

extension UiMessageRef on Ref {
  FutureOr<ActionResult?> sendUiMessage<ActionResult>(
    UiMessage<ActionResult> message,
  ) {
    return read(uiMessageProvider.notifier).send(message);
  }
}

extension UiMessageWidgetRef on WidgetRef {
  FutureOr<ActionResult?> sendUiMessage<ActionResult>(
    UiMessage<ActionResult> message,
  ) {
    return read(uiMessageProvider.notifier).send(message);
  }
}
