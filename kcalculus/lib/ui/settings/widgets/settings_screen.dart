import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/settings/view_models/settings_view_model.dart';
import 'package:kcalculus/ui/settings/widgets/action_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/app_theme_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/option_setting_screen.dart';
import 'package:kcalculus/ui/settings/widgets/settings_group.dart';
import 'package:kcalculus/ui/settings/widgets/switch_setting_tile.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:logging/logging.dart';
import 'package:share_plus/share_plus.dart';

final Logger _log = Logger('SettingsScreen');

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends ConsumerState<SettingsScreen>
    with StateMessenger, ProgressiveState {
  late final _assignments = <AppSettingsCommand, UiAssignment>{
    AppSettingsCommand.shareBackup: _shareBackup,
    AppSettingsCommand.showBackupFailureNotification:
        _showBackupFailureNotification,
    AppSettingsCommand.showRestoreSuccessNotification:
        _showRestoreSuccessNotification,
    AppSettingsCommand.showRestoreFailureNotification:
        _showRestoreFailureNotification,
  };

  void _selectTheme(AppSettings settings) async {
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

  void _setCrashlyticsEnabled(bool enabled) {
    final viewModel = ref.read(appSettingsViewModel.notifier);
    viewModel.setCrashlyticsEnabled(enabled);
  }

  void _backup() async {
    wrapInProgress(
      ref.read(appSettingsViewModel.notifier).backup(),
    );
  }

  void _restore() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }

    final fromFile = result.files.single.path!;

    if (mounted) {
      final confirmed = await showMessageDialog<bool>(
        message: l10n(context).messageRestoreConfirmation(fromFile),
        actions: {
          l10n(context).actionProceed: () => true,
          l10n(context).actionCancel: () => false,
        },
        messageType: MessageType.warning,
      );

      if (confirmed == true) {
        wrapInProgress(
          ref.read(appSettingsViewModel.notifier).restore(fromFile),
        );
      }
    }
  }

  void _shareBackup(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    Share.shareXFiles([
      XFile(command.payload as String),
    ]);
    command.complete();
  }

  void _showBackupFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageBackupFailure);
    command.complete();
  }

  void _showRestoreSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showMessage(
      l10n(context).messageRestoreSuccess(command.payload as String),
      MessageType.info,
    );
    command.complete();
  }

  void _showRestoreFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showMessage(
      l10n(context).messageRestoreFailure(command.payload as String),
      MessageType.error,
    );
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(appSettingsViewModel);

    final Widget body;
    switch (settings) {
      case AsyncError(:final error, :final stackTrace):
        _log.severe('Failed to load settings', error, stackTrace);
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
        body = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SettingsGroup(
                title: l10n(context).settingsGroupCommon,
                children: [
                  AppThemeSettingTile(
                    theme: settings.valueOrNull?.theme,
                    onTap: settings.isLoading
                        ? null
                        : () {
                            _selectTheme(settings.value!);
                          },
                  ),
                  SwitchSettingTile(
                    value: settings.valueOrNull?.crashlyticsEnabled ?? false,
                    onChanged:
                        settings.isLoading ? null : _setCrashlyticsEnabled,
                    title: l10n(context).settingCrashReportingTitle,
                    subtitle: l10n(context).settingCrashReportingSubtitle,
                    icon: Icons.bug_report,
                  ),
                ],
              ),
              SettingsGroup(
                title: l10n(context).settingsGroupBackup,
                children: [
                  ActionSettingTile(
                    onTap: settings.isLoading ? null : _backup,
                    title: l10n(context).settingBackupTitle,
                    subtitle: l10n(context).settingBackupSubtitle,
                    icon: Icons.download,
                  ),
                  ActionSettingTile(
                    onTap: settings.isLoading ? null : _restore,
                    title: l10n(context).settingRestoreTitle,
                    subtitle: l10n(context).settingRestoreSubtitle,
                    icon: Icons.upload,
                  ),
                ],
              ),
            ],
          ),
        );
        break;
    }

    final viewModel = ref.read(appSettingsViewModel.notifier);

    return UiSubordinate(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n(context).screenSettings,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
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
      ),
    );
  }
}
