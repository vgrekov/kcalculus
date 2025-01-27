import 'dart:async';

class UiCommand<Command, Payload, Result> implements Completer<Result> {
  UiCommand(
    this.type, {
    this.payload,
  }) : _completer = Completer<Result>();

  final Command type;

  final Payload? payload;

  final Completer<Result> _completer;

  @override
  void complete([FutureOr<Result>? value]) {
    _completer.complete(value);
  }

  @override
  void completeError(Object error, [StackTrace? stackTrace]) {
    _completer.completeError(error, stackTrace);
  }

  @override
  Future<Result> get future => _completer.future;

  @override
  bool get isCompleted => _completer.isCompleted;
}
