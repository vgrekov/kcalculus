import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required AppTheme theme,
    bool? crashlyticsEnabled,
    bool? analyticsEnabled,
    int? signedAgreementVersion,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
