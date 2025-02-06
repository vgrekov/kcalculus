import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/ui/app/view_models/app_view_model.dart';
import 'package:kcalculus/ui/common/themes/dark.dart' as dark;
import 'package:kcalculus/ui/common/themes/light.dart' as light;
import 'package:kcalculus/ui/maintenance/widgets/maintenance_screen.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_screen.dart';
import 'package:kcalculus/ui/providers.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('App');

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends ConsumerState<App> {
  late final ProviderSubscription<AsyncValue<AppSettings>>
      _settingsSubscription;

  @override
  void initState() {
    final settingsAsync = ref.read(appSettingsRepositoryProvider);
    _onAppSettings(settingsAsync);

    _settingsSubscription = ref.listenManual(
      appSettingsRepositoryProvider,
      (prev, next) {
        _onAppSettings(next);
      },
    );

    super.initState();
  }

  void _onAppSettings(AsyncValue<AppSettings> settingsAsync) {
    settingsAsync.whenData(
      (settings) {
        if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled !=
            settings.crashlyticsEnabled) {
          FirebaseCrashlytics.instance
              .setCrashlyticsCollectionEnabled(settings.crashlyticsEnabled);

          _log.info('crashlyticsEnabled: ${settings.crashlyticsEnabled}');
        }
      },
    );
  }

  @override
  void dispose() {
    _settingsSubscription.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(appViewModel);

    final AppTheme appTheme;
    final bool maintenanceRequired;
    switch (uiState) {
      case AsyncData(:final value):
        appTheme = value.theme;
        maintenanceRequired = value.maintenanceRequired;
        break;
      case AsyncError(:final error, :final stackTrace):
        _log.severe('Failed to load app UI state', error, stackTrace);
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
