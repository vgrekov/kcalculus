import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/repositories/app_settings_repository.dart';

class ConsentViewModel extends AutoDisposeNotifier<void> {
  @override
  void build() {
    // NOOP
  }

  void saveSettings({
    required bool crashlyticsEnabled,
    required bool analyticsEnabled,
  }) async {
    final repository = ref.read(appSettingsRepositoryProvider.notifier);
    final settings = await ref.read(appSettingsRepositoryProvider.future);
    repository.saveSettings(
      settings.copyWith(
        crashlyticsEnabled: crashlyticsEnabled,
        analyticsEnabled: analyticsEnabled,
      ),
    );
  }
}

final consentViewModel = NotifierProvider.autoDispose(
  ConsentViewModel.new,
);
