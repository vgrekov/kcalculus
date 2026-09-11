import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lifecycle_state.freezed.dart';

@freezed
sealed class LifecycleState with _$LifecycleState {
  const LifecycleState._();

  const factory LifecycleState.$default({
    required AppLifecycleState? currentAppState,
    required Map<AppLifecycleState, bool> triggers,
  }) = _LifecycleState;

  factory LifecycleState({
    required AppLifecycleState? currentAppState,
  }) => LifecycleState.$default(
    currentAppState: currentAppState,
    triggers: {
      for (final s in AppLifecycleState.values) s: false,
    },
  );
}
