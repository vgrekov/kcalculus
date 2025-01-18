import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/app_settings/app_settings_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

class AppSettingsViewModel extends AsyncNotifier<AppSettings> {
  @override
  FutureOr<AppSettings> build() {
    return ref.watch(appSettingsRepository.future);
  }

  Future<void> setTheme(AppTheme theme) async {
    final repository = ref.read(appSettingsRepository.notifier);
    await repository.setSettings(
      state.value!.copyWith(
        theme: theme,
      ),
    );
  }
}

final appSettingsViewModel =
    AsyncNotifierProvider<AppSettingsViewModel, AppSettings>(
  () => AppSettingsViewModel(),
);
