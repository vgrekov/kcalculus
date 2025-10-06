import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';

abstract class ChangeSignalNotifier extends Notifier<ChangeSignal?> {
  @override
  ChangeSignal? build() => null;

  void emitChangeSignal() {
    state = ChangeSignal();
  }
}
