import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';

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
    repository.setSettings(
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
