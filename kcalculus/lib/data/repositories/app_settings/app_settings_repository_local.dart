import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/app_settings/app_settings_repository.dart';
import 'package:kcalculus/data/services/local/app_settings/app_settings_shared_pref_model.dart';
import 'package:kcalculus/data/services/local/app_settings/app_settings_shared_pref_service.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

class LocalAppSettingsRepository extends AppSettingsRepository {
  LocalAppSettingsRepository({
    required AppSettingsSharedPrefService service,
  }) : _service = service;

  final AppSettingsSharedPrefService _service;

  Future<AppSettings> _load() async {
    final model = await _service.getSettings();
    return AppSettings(
      theme:
          AppTheme.values.where((t) => t.name == model.themeName).firstOrNull ??
              AppTheme.system,
    );
  }

  @override
  FutureOr<AppSettings> build() async {
    return _load();
  }

  @override
  Future<void> setSettings(AppSettings settings) async {
    await _service.setSettings(
      AppSettingsSharedPrefModel(themeName: settings.theme.name),
    );

    state = await AsyncValue.guard<AppSettings>(_load);
  }
}
