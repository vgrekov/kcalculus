import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/utils/lifecycle/lifecycle_state.dart';

class _LifecycleStateNotifier extends AutoDisposeNotifier<LifecycleState> {
  @override
  LifecycleState build() {
    final listener = AppLifecycleListener(
      onStateChange: (lifecycleState) {
        state = state.copyWith(
          currentAppState: lifecycleState,
          triggers: {
            ...state.triggers,
            lifecycleState: !state.triggers[lifecycleState]!,
          },
        );
      },
    );

    ref.onDispose(listener.dispose);

    return LifecycleState(
      currentAppState: WidgetsBinding.instance.lifecycleState,
    );
  }
}

final lifecycleStateProvider =
    NotifierProvider.autoDispose<_LifecycleStateNotifier, LifecycleState>(
      _LifecycleStateNotifier.new,
    );
