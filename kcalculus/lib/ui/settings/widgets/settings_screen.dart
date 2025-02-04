import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/settings/view_models/settings_view_model.dart';
import 'package:kcalculus/ui/settings/widgets/app_theme_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/option_setting_screen.dart';
import 'package:kcalculus/ui/settings/widgets/settings_group.dart';
import 'package:kcalculus/utils/l10n.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _selectTheme(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final theme = await Navigator.of(context).push<AppTheme>(
      MaterialPageRoute(
        builder: (context) => OptionSettingScreen<AppTheme>(
          title: l10n(context).settingAppTheme,
          options: AppTheme.values,
          selectedOption: settings.theme,
          optionTitleProvider: (theme) => theme.localName(l10n(context)),
        ),
      ),
    );

    if (theme != null) {
      final viewModel = ref.read(appSettingsViewModel.notifier);
      viewModel.setTheme(theme);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsViewModel);

    final Widget body;
    switch (settings) {
      case AsyncData(:final value):
        body = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SettingsGroup(
                title: l10n(context).settingsGroupCommon,
                children: [
                  AppThemeSettingTile(
                    theme: value.theme,
                    onTap: () {
                      _selectTheme(context, ref, value);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
        break;
      case AsyncError(:final error):
        print(error);
        body = Center(
          child: Text(
            l10n(context).messageUnknownError,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        );
        break;
      default:
        body = const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n(context).screenSettings,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
      body: body,
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        padding: EdgeInsets.only(top: 32),
        child: const ScreenTabBar(
          selectedTab: ScreenTab.settings,
        ),
      ),
    );
  }
}
