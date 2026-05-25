import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';
import 'package:kcalculus/domain/auth/models/user.dart';
import 'package:kcalculus/ui/access_guard/utils/premium_feature.dart';
import 'package:kcalculus/ui/access_guard/widgets/access_guard.dart';
import 'package:kcalculus/ui/auth/login/widgets/login_screen.dart';
import 'package:kcalculus/ui/common/messaging/models/ui_message.dart';
import 'package:kcalculus/ui/common/messaging/services/ui_message_service.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/nutrients/defaults/widgets/nutrient_defaults_screen.dart';
import 'package:kcalculus/ui/nutrients/goals/list/widgets/nutrient_goal_list_screen.dart';
import 'package:kcalculus/ui/settings/view_models/settings_view_model.dart';
import 'package:kcalculus/ui/settings/widgets/action_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/app_theme_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/option_setting_screen.dart';
import 'package:kcalculus/ui/settings/widgets/premium_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/settings_group.dart';
import 'package:kcalculus/ui/settings/widgets/switch_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/user_setting_tile.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

final Logger _log = Logger('SettingsScreen');

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends ConsumerState<SettingsScreen>
    with StateMessenger {
  late final _assignments = <AppSettingsCommand, UiAssignment>{
    AppSettingsCommand.shareBackup: _shareBackup,
    AppSettingsCommand.showBackupFailureNotification:
        _showBackupFailureNotification,
    AppSettingsCommand.showRestoreSuccessNotification:
        _showRestoreSuccessNotification,
    AppSettingsCommand.showRestoreFailureNotification:
        _showRestoreFailureNotification,
    AppSettingsCommand.showAccountDeletedNotification:
        _showAccountDeletedNotification,
    AppSettingsCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  final _accessGuardKey = UniqueKey();

  void _login() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _logout() async {
    final confirmed = await showConfirmation(
      l10n(context).messageLogoutConfirmation,
    );

    if (confirmed == true) {
      await ref.read(appSettingsViewModel.notifier).logout();
    }
  }

  void _deleteAccount() async {
    final proceed = await showMessageDialog(
      message: l10n(context).messageLoginToDeleteAccount,
      actions: {
        l10n(context).actionCancel: () => false,
        l10n(context).actionProceed: () => true,
      },
      messageType: MessageType.info,
    );

    final state = await ref.read(appSettingsViewModel.future);

    if (proceed == true && mounted) {
      final user = await Navigator.of(context).push<User>(
        MaterialPageRoute(
          builder: (context) => LoginScreen(
            email: state.user?.email,
            showForgotPassword: false,
            showCreateNewAccount: false,
            showContinueWithoutAccount: false,
          ),
        ),
      );

      if (user != null && mounted) {
        final confirmed = await showMessageDialog(
          message: l10n(context).messageDeleteAccountConfirmation(user.email),
          actions: {
            l10n(context).actionCancel: () => false,
            l10n(context).actionDeleteAccount: () => true,
          },
          messageType: MessageType.warning,
        );

        if (confirmed == true) {
          await ref.read(appSettingsViewModel.notifier).deleteAccount();
        }
      }
    }
  }

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

  void _setAnalyticsEnabled(bool enabled) {
    final viewModel = ref.read(appSettingsViewModel.notifier);
    viewModel.setAnalyticsEnabled(enabled);
  }

  void _configureDefaultNutrients() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NutrientDefaultsScreen(),
      ),
    );
  }

  void _configureNutrientGoals() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NutrientGoalListScreen(),
      ),
    );
  }

  void _backup() async {
    premiumFeature(ref, _accessGuardKey, () {
      ProgressOverlay.wrap(
        context,
        ref.read(appSettingsViewModel.notifier).backup(),
      );
    });
  }

  void _restore() async {
    premiumFeature(ref, _accessGuardKey, () async {
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

        if (confirmed == true && mounted) {
          ProgressOverlay.wrap(
            context,
            ref.read(appSettingsViewModel.notifier).restore(fromFile),
          );
        }
      }
    });
  }

  void _shareBackup(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final file = command.payload as File;

    command.complete();

    final backupPath = await FilePicker.platform.saveFile(
      fileName: path.basename(file.path),
      bytes: file.readAsBytesSync(),
    );

    if (backupPath != null) {
      _showBackupSuccessNotification(backupPath);
    }
  }

  void _showBackupSuccessNotification(String backupPath) {
    showMessage(
      l10n(context).messageBackupSuccess(backupPath),
      MessageType.info,
    );
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

  void _showAccountDeletedNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final user = command.payload as User?;

    ref.sendUiMessage(
      UiDialog.alert(
        text: l10n(context).messageAccountDeleted(user?.email ?? ''),
      ),
    );

    command.complete();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(appSettingsViewModel);

    final listStyle = Theme.of(context).extension<ListStyle>();

    final Widget body;

    String? version;

    switch (uiState) {
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
          padding: EdgeInsets.symmetric(
            horizontal: listStyle?.horizontalGap ?? 0,
          ),
          child: ListView(
            children: [
              if (listStyle != null) SizedBox(height: listStyle.verticalGap),
              const SettingsGroup(
                children: [
                  PremiumSettingTile(),
                ],
              ),
              if (listStyle != null) SizedBox(height: listStyle.verticalGap),
              SettingsGroup(
                children: [
                  UserSettingTile(
                    user: uiState.valueOrNull?.user,
                    onLogin: uiState.isLoading ? null : _login,
                    onLogout: uiState.isLoading ? null : _logout,
                    onDeleteAccount: uiState.isLoading ? null : _deleteAccount,
                  ),
                ],
              ),
              if (listStyle != null) SizedBox(height: listStyle.verticalGap),
              SettingsGroup(
                children: [
                  AppThemeSettingTile(
                    theme: uiState.valueOrNull?.settings.theme,
                    onTap: uiState.isLoading
                        ? null
                        : () {
                            _selectTheme(uiState.value!.settings);
                          },
                  ),
                  ActionSettingTile(
                    onTap: uiState.isLoading
                        ? null
                        : _configureDefaultNutrients,
                    title: l10n(context).settingDefaultNutrientsTitle,
                    subtitle: l10n(context).settingDefaultNutrientsSubtitle,
                    icon: Icons.list_alt,
                    premiumFeature: false,
                  ),
                  ActionSettingTile(
                    onTap: uiState.isLoading ? null : _configureNutrientGoals,
                    title: l10n(context).settingNutrientGoalsTitle,
                    subtitle: l10n(context).settingNutrientGoalsSubtitle,
                    icon: Icons.track_changes,
                    premiumFeature: false,
                  ),
                ],
              ),
              if (uiState.valueOrNull?.user == null) ...[
                if (listStyle != null) SizedBox(height: listStyle.verticalGap),
                SettingsGroup(
                  children: [
                    ActionSettingTile(
                      onTap: uiState.isLoading ? null : _backup,
                      title: l10n(context).settingBackupTitle,
                      subtitle: l10n(context).settingBackupSubtitle,
                      icon: Icons.download,
                      premiumFeature: true,
                    ),
                    ActionSettingTile(
                      onTap: uiState.isLoading ? null : _restore,
                      title: l10n(context).settingRestoreTitle,
                      subtitle: l10n(context).settingRestoreSubtitle,
                      icon: Icons.upload,
                      premiumFeature: true,
                    ),
                  ],
                ),
              ],
              if (listStyle != null) SizedBox(height: listStyle.verticalGap),
              SettingsGroup(
                children: [
                  SwitchSettingTile(
                    value:
                        uiState.valueOrNull?.settings.crashlyticsEnabled ??
                        false,
                    onChanged: uiState.isLoading
                        ? null
                        : _setCrashlyticsEnabled,
                    title: l10n(context).settingCrashReportingTitle,
                    subtitle: l10n(context).settingCrashReportingSubtitle,
                    icon: Icons.bug_report,
                  ),
                  SwitchSettingTile(
                    value:
                        uiState.valueOrNull?.settings.analyticsEnabled ?? false,
                    onChanged: uiState.isLoading ? null : _setAnalyticsEnabled,
                    title: l10n(context).settingAnalyticsTitle,
                    subtitle: l10n(context).settingAnalyticsSubtitle,
                    icon: Icons.analytics,
                  ),
                ],
              ),
              if (listStyle != null) SizedBox(height: listStyle.verticalGap),
            ],
          ),
        );

        final info = uiState.valueOrNull?.appInfo;
        version = info == null
            ? null
            : l10n(context).appVersion(
                info.appName,
                info.version,
                info.buildNumber,
              );

        break;
    }

    final viewModel = ref.read(appSettingsViewModel.notifier);

    return AccessGuard(
      key: _accessGuardKey,
      child: UiSubordinate(
        commandProvider: viewModel.commandProvider,
        assignments: _assignments,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n(context).screenSettings,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  version ?? '',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          body: body,
          bottomNavigationBar: Container(
            color: Theme.of(context).colorScheme.surfaceContainer,
            padding: EdgeInsets.only(top: 8),
            child: const ScreenTabBar(
              selectedTab: ScreenTab.settings,
            ),
          ),
        ),
      ),
    );
  }
}
