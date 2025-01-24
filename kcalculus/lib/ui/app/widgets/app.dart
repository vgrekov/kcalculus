import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/screens/meals/meal_list.dart';
import 'package:kcalculus/ui/app/view_models/app_view_model.dart';
import 'package:kcalculus/ui/common/themes/dark.dart' as dark;
import 'package:kcalculus/ui/common/themes/light.dart' as light;
import 'package:kcalculus/ui/maintenance/widgets/maintenance_screen.dart';
import 'package:kcalculus/ui/providers.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(appViewModel);

    final AppTheme appTheme;
    final bool maintenanceRequired;
    switch (uiState) {
      case AsyncData(:final value):
        appTheme = value.settings.theme;
        maintenanceRequired = value.maintenanceRequired;
        break;
      case AsyncError(:final error):
        print(error);
        appTheme = AppTheme.system;
        maintenanceRequired = true;
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

    final navigatorKey = ref.watch(navigatorKeyProvider);

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
      navigatorKey: navigatorKey,
      home: maintenanceRequired
          ? const MaintenanceScreen()
          : const MealListScreen(),
    );
  }
}
