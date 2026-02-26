import 'dart:async';

import 'package:kcalculus/ui/common/messaging/models/ui_dialog_type.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message_action.dart';

sealed class UiMessage<ActionResult> {
  UiMessage({
    required this.text,
  }) : _completer = Completer<ActionResult?>();

  final String text;

  final Completer<ActionResult?> _completer;

  Future<ActionResult?> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  FutureOr<ActionResult?> castActionResult(FutureOr<dynamic> value) =>
      value is Future
      ? value.then((v) => v as ActionResult?)
      : value as ActionResult?;

  void complete(FutureOr<ActionResult?> actionResult) {
    if (!isCompleted) {
      _completer.complete(actionResult);
    }
  }

  void completeError(Object error, [StackTrace? stackTrace]) {
    if (!isCompleted) {
      _completer.completeError(error, stackTrace);
    }
  }
}

class UiNotification<ActionResult> extends UiMessage<ActionResult> {
  static const kDefaultDuration = Duration(milliseconds: 1500);

  UiNotification({
    required super.text,
    this.duration = kDefaultDuration,
    this.action,
  });

  UiNotification.withUndo({
    required String text,
    Duration duration = kDefaultDuration,
    required UiMessageActionCallback<ActionResult> callback,
  }) : this(
         text: text,
         duration: duration,
         action: UiMessageAction<ActionResult>(
           label: (l10n) => l10n.actionUndo,
           callback: callback,
         ),
       );

  final Duration duration;

  final UiMessageAction<ActionResult>? action;
}

class UiDialog<ActionResult> extends UiMessage<ActionResult> {
  static UiDialog<void> alert({
    required String text,
    UiDialogType type = UiDialogType.info,
  }) => UiDialog<void>(
    text: text,
    type: type,
    actions: [
      UiMessageAction<void>(
        label: (l10n) => l10n.actionOk,
        callback: (_, _) {},
      ),
    ],
  );

  static UiDialog<bool> confirm({
    required String text,
    UiDialogType type = UiDialogType.confirm,
  }) => UiDialog<bool>(
    text: text,
    type: type,
    actions: [
      UiMessageAction<bool>(
        label: (l10n) => l10n.actionCancel,
        callback: (_, _) => false,
      ),
      UiMessageAction<bool>(
        label: (l10n) => l10n.actionOk,
        callback: (_, _) => true,
      ),
    ],
  );

  UiDialog({
    required super.text,
    required this.type,
    this.actions = const [],
  });

  final UiDialogType type;

  final List<UiMessageAction<ActionResult>> actions;
}
