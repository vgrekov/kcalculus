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

@Freezed(
  fromJson: false,
  toJson: true,
)
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required AppTheme theme,
    required bool crashlyticsEnabled,
  }) = _AppSettings;
}
