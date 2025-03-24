import 'package:kcalculus/data/services/local/app_settings/app_settings_shared_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPrefService {
  static const _kAppTheme = 'appTheme';

  static const _kCrashlyticsEnabled = 'crashlyticsEnabled';

  static const _kAnalyticsEnabled = 'analyticsEnabled';

  static const _kSignedAgreementVersion = 'signedAgreementVersion';

  Future<AppSettingsSharedPrefModel> getSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AppSettingsSharedPrefModel(
      themeName: prefs.getString(_kAppTheme),
      crashlyticsEnabled: prefs.getBool(_kCrashlyticsEnabled),
      analyticsEnabled: prefs.getBool(_kAnalyticsEnabled),
      signedAgreementVersion: prefs.getInt(_kSignedAgreementVersion),
    );
  }

  Future<void> setSettings(AppSettingsSharedPrefModel model) async {
    final prefs = await SharedPreferences.getInstance();

    if (model.themeName != null) {
      await prefs.setString(_kAppTheme, model.themeName!);
    } else {
      await prefs.remove(_kAppTheme);
    }

    if (model.crashlyticsEnabled != null) {
      await prefs.setBool(_kCrashlyticsEnabled, model.crashlyticsEnabled!);
    } else {
      await prefs.remove(_kCrashlyticsEnabled);
    }

    if (model.analyticsEnabled != null) {
      await prefs.setBool(_kAnalyticsEnabled, model.analyticsEnabled!);
    } else {
      await prefs.remove(_kAnalyticsEnabled);
    }

    if (model.signedAgreementVersion != null) {
      await prefs.setInt(
          _kSignedAgreementVersion, model.signedAgreementVersion!);
    } else {
      await prefs.remove(_kSignedAgreementVersion);
    }
  }
}
