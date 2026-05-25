import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';
import 'package:kcalculus/l10n/app_localizations.dart';
import 'package:kcalculus/ui/agreement/widgets/agreement_screen.dart';
import 'package:kcalculus/ui/app/view_models/app_ui_state.dart';
import 'package:kcalculus/ui/app/view_models/app_view_model.dart';
import 'package:kcalculus/ui/auth/login/widgets/login_screen.dart';
import 'package:kcalculus/ui/common/messaging/widgets/ui_message_handler.dart';
import 'package:kcalculus/ui/common/themes/themes.dart';
import 'package:kcalculus/ui/consent/widgets/consent_screen.dart';
import 'package:kcalculus/ui/import/widgets/import_screen.dart';
import 'package:kcalculus/ui/maintenance/widgets/maintenance_screen.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('App');

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(appViewModel);

    final theme = uiState.valueOrNull?.theme;

    final Widget home;
    switch (uiState) {
      case AsyncData(:final value):
        home = switch (value.stage) {
          AppStage.agreement => const AgreementScreen(),
          AppStage.dataSharingConsent => const ConsentScreen(),
          AppStage.maintenance => const MaintenanceScreen(),
          AppStage.authentication => const LoginScreen(),
          AppStage.import => ImportScreen(),
          _ => const MealListScreen(),
        };
        break;
      case AsyncError(:final error, :final stackTrace):
        _log.severe('Failed to load app UI state', error, stackTrace);
        home = Center(
          child: Builder(
            builder: (context) => Text(
              l10n(context).messageUnknownError,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        );
        break;
      default:
        home = const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
    }

    return MaterialApp(
      key: ValueKey(uiState.valueOrNull?.stage),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: switch (theme) {
        AppTheme.light => kLightTheme,
        AppTheme.dark => kDarkTheme,
        _ => switch (MediaQuery.of(context).platformBrightness) {
          Brightness.light => kLightTheme,
          Brightness.dark => kDarkTheme,
        },
      },
      home: UiMessageHandler(
        child: home,
      ),
    );
  }
}
