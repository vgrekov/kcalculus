import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/app_settings/app_settings_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/screens/splash.dart';
import 'package:kcalculus/ui/common/themes/light.dart' as light;
import 'package:kcalculus/ui/common/themes/dark.dart' as dark;

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsRepository);

    final AppTheme appTheme;
    switch (settings) {
      case AsyncData(:final value):
        appTheme = value.theme;
        break;
      case AsyncError(:final error):
        print(error);
        appTheme = AppTheme.system;
        break;
      default:
        return const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
    }

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: switch (appTheme) {
        AppTheme.system => switch (MediaQuery.of(context).platformBrightness) {
            Brightness.light => light.theme,
            Brightness.dark => dark.theme,
          },
        AppTheme.light => light.theme,
        AppTheme.dark => dark.theme,
      },
      home: const SplashScreen(),
    );
  }
}
