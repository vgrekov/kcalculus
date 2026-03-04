import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/app_settings/models/app_settings_shared_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPrefService
    extends AsyncNotifier<AppSettingsSharedPrefModel> {
  static const _kAppTheme = 'appTheme';

  static const _kCrashlyticsEnabled = 'crashlyticsEnabled';

  static const _kAnalyticsEnabled = 'analyticsEnabled';

  static const _kSignedAgreementVersion = 'signedAgreementVersion';

  static const _kScannerDisclaimerEnabled = 'scannerDisclaimerEnabled';

  @override
  FutureOr<AppSettingsSharedPrefModel> build() {
    return _loadSettings();
  }

  Future<AppSettingsSharedPrefModel> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AppSettingsSharedPrefModel(
      themeName: prefs.getString(_kAppTheme),
      crashlyticsEnabled: prefs.getBool(_kCrashlyticsEnabled),
      analyticsEnabled: prefs.getBool(_kAnalyticsEnabled),
      signedAgreementVersion: prefs.getInt(_kSignedAgreementVersion),
      scannerDisclaimerEnabled: prefs.getBool(_kScannerDisclaimerEnabled),
    );
  }

  Future<void> saveSettings(AppSettingsSharedPrefModel model) async {
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

    if (model.scannerDisclaimerEnabled != null) {
      await prefs.setBool(
          _kScannerDisclaimerEnabled, model.scannerDisclaimerEnabled!);
    } else {
      await prefs.remove(_kScannerDisclaimerEnabled);
    }

    state = AsyncData(model);
  }
}

final appSettingsSharedPrefServiceProvider = AsyncNotifierProvider<
    AppSettingsSharedPrefService, AppSettingsSharedPrefModel>(
  AppSettingsSharedPrefService.new,
);
