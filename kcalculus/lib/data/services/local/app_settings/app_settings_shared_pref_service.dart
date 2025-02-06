import 'package:kcalculus/data/services/local/app_settings/app_settings_shared_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPrefService {
  static const _kAppTheme = 'appTheme';

  static const _kCrashlyticsEnabled = 'crashlyticsEnabled';

  Future<AppSettingsSharedPrefModel> getSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AppSettingsSharedPrefModel(
      themeName: prefs.getString(_kAppTheme),
      crashlyticsEnabled: prefs.getBool(_kCrashlyticsEnabled),
    );
  }

  Future<void> setSettings(AppSettingsSharedPrefModel model) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_kAppTheme, model.themeName ?? '');
    await prefs.setBool(
        _kCrashlyticsEnabled, model.crashlyticsEnabled ?? false);
  }
}
