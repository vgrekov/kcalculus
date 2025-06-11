import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

enum AppTheme {
  system,
  light,
  dark;

  String localName(AppLocalizations loc) {
    return switch (this) {
      system => loc.settingAppThemeSystem,
      light => loc.settingAppThemeLight,
      dark => loc.settingAppThemeDark,
    };
  }
}

@freezed
sealed class AppSettings with _$AppSettings {
  const factory AppSettings({
    required AppTheme theme,
    bool? crashlyticsEnabled,
    bool? analyticsEnabled,
    int? signedAgreementVersion,
    required bool scannerDisclaimerEnabled,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
