import 'package:kcalculus/data/services/local/app_settings/app_settings_shared_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPrefService {
  static const _kAppTheme = 'appTheme';

  Future<AppSettingsSharedPrefModel> getSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AppSettingsSharedPrefModel(
      themeName: prefs.getString(_kAppTheme),
    );
  }

  Future<void> setSettings(AppSettingsSharedPrefModel model) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_kAppTheme, model.themeName ?? '');
  }
}
