import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class AppSettings {
  const AppSettings({
    required this.theme,
  });

  final AppTheme theme;

  AppSettings copyWith({
    AppTheme? theme,
  }) {
    return AppSettings(
      theme: theme ?? this.theme,
    );
  }
}
