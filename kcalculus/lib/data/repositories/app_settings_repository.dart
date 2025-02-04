import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

abstract class AppSettingsRepository extends AsyncNotifier<AppSettings> {
  Future<void> setSettings(AppSettings settings);
}
