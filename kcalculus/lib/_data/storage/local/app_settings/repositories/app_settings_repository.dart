import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/repositories/app_settings_repository.dart';
import 'package:kcalculus/_data/storage/local/app_settings/models/app_settings_shared_pref_model.dart';
import 'package:kcalculus/_data/storage/local/app_settings/services/app_settings_shared_pref_service.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

class LocalAppSettingsRepository extends AppSettingsRepository {
  @override
  FutureOr<AppSettings> build() async {
    ref.watch(appSettingsSharedPrefServiceProvider);

    final settings =
        await ref.read(appSettingsSharedPrefServiceProvider.future);

    return settings.toDomain();
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    final service = ref.read(appSettingsSharedPrefServiceProvider.notifier);

    await service.saveSettings(
      AppSettingsSharedPrefModel.fromDomain(settings),
    );
  }
}

final localAppSettingsRepositoryProvider =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  LocalAppSettingsRepository.new,
);
