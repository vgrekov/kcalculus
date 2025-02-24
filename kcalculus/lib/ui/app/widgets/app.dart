import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/ui/agreement/widgets/agreement_screen.dart';
import 'package:kcalculus/ui/app/view_models/app_ui_state.dart';
import 'package:kcalculus/ui/app/view_models/app_view_model.dart';
import 'package:kcalculus/ui/common/themes/dark.dart' as dark;
import 'package:kcalculus/ui/common/themes/light.dart' as light;
import 'package:kcalculus/ui/consent/widgets/consent_screen.dart';
import 'package:kcalculus/ui/maintenance/widgets/maintenance_screen.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_screen.dart';
import 'package:kcalculus/ui/providers.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('App');

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(appViewModel);

    final navigatorKey = ref.watch(navigatorKeyProvider);

    switch (uiState) {
      case AsyncData(:final value):
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: switch (value.theme) {
            AppTheme.system => switch (
                  MediaQuery.of(context).platformBrightness) {
                Brightness.light => light.theme,
                Brightness.dark => dark.theme,
              },
            AppTheme.light => light.theme,
            AppTheme.dark => dark.theme,
          },
          navigatorKey: navigatorKey,
          home: switch (value.stage) {
            AppStage.agreement => const AgreementScreen(),
            AppStage.dataSharingConsent => const ConsentScreen(),
            AppStage.maintenance => const MaintenanceScreen(),
            _ => const MealListScreen(),
          },
        );
      case AsyncError(:final error, :final stackTrace):
        _log.severe('Failed to load app UI state', error, stackTrace);
        return Center(
          child: Text(
            l10n(context).messageUnknownError,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        );
      default:
        return const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
