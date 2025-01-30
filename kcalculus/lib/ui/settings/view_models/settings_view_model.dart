import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

class AppSettingsViewModel extends AutoDisposeAsyncNotifier<AppSettings> {
  @override
  FutureOr<AppSettings> build() {
    return ref.watch(appSettingsRepositoryProvider.future);
  }

  Future<void> setTheme(AppTheme theme) async {
    final repository = ref.read(appSettingsRepositoryProvider.notifier);
    await repository.setSettings(
      state.value!.copyWith(
        theme: theme,
      ),
    );
  }
}
