import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/app_settings/app_settings_repository_local.dart';
import 'package:kcalculus/data/services/local/app_settings/app_settings_shared_pref_service.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

abstract class AppSettingsRepository extends AsyncNotifier<AppSettings> {
  Future<void> setSettings(AppSettings settings);
}

final appSettingsRepository =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  () {
    return LocalAppSettingsRepository(
      service: AppSettingsSharedPrefService(),
    );
  },
);
