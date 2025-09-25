import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/auth/repositories/user_repository.dart';
import 'package:kcalculus/_data/storage/_common/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/settings/view_models/settings_ui_state.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

final _log = Logger('AppSettingsViewModel');

enum AppSettingsCommand {
  shareBackup,
  showBackupFailureNotification,
  showRestoreSuccessNotification,
  showRestoreFailureNotification,
}

class AppSettingsViewModel extends AutoDisposeAsyncNotifier<SettingsUiState> {
  final _packageInfo = PackageInfo.fromPlatform();

  UiCommander<AppSettingsCommand>? _commander;

  @override
  FutureOr<SettingsUiState> build() async {
    _commander = UiCommander<AppSettingsCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    final settings = await ref.watch(appSettingsRepositoryProvider.future);

    final user = await ref.watch(userRepositoryProvider.future);

    return SettingsUiState(
      settings: settings,
      user: user,
      packageInfo: await _packageInfo,
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> logout() async {
    final userRepository = ref.read(userRepositoryProvider.notifier);
    await userRepository.logout();
  }

  Future<void> setTheme(AppTheme theme) async {
    final repository = ref.read(appSettingsRepositoryProvider.notifier);
    await repository.saveSettings(
      state.value!.settings.copyWith(
        theme: theme,
      ),
    );
  }

  Future<void> setCrashlyticsEnabled(bool enabled) async {
    final repository = ref.read(appSettingsRepositoryProvider.notifier);
    await repository.saveSettings(
      state.value!.settings.copyWith(
        crashlyticsEnabled: enabled,
      ),
    );
  }

  Future<void> setAnalyticsEnabled(bool enabled) async {
    final repository = ref.read(appSettingsRepositoryProvider.notifier);
    await repository.saveSettings(
      state.value!.settings.copyWith(
        analyticsEnabled: enabled,
      ),
    );
  }

  Future<void> backup() async {
    _log.finer('backup() START');

    try {
      _log.finest('backup() Backing up');

      final backupRepository = ref.read(backupRepositoryProvider);
      final backupFile = await backupRepository.backup();

      _log.info('Backup complete');
      _log.finest('backup() Backed up to: ${backupFile.path}');
      _log.eventDbBackup();

      _commander!.send<File, void>(
        AppSettingsCommand.shareBackup,
        payload: backupFile,
      );
    } catch (error, stackTrace) {
      _log.severe('Failed to backup', error, stackTrace);

      _commander!.send<String, void>(
        AppSettingsCommand.showBackupFailureNotification,
      );
    }

    _log.finer('backup() END');
  }

  Future<void> restore(String fromFile) async {
    _log.finer('restore() START');

    try {
      _log.finest('restore() Restoring from: $fromFile');

      final backupRepository = ref.read(backupRepositoryProvider);
      await backupRepository.restore(File(fromFile));

      _log.info('Restore complete');
      _log.eventDbRestore();

      _commander!.send<String, void>(
        AppSettingsCommand.showRestoreSuccessNotification,
        payload: fromFile,
      );
    } catch (error, stackTrace) {
      _log.severe('Failed to restore from $fromFile', error, stackTrace);

      _commander!.send<String, void>(
        AppSettingsCommand.showRestoreFailureNotification,
        payload: fromFile,
      );
    }

    _log.finer('restore() END');
  }
}

final appSettingsViewModel =
    AsyncNotifierProvider.autoDispose<AppSettingsViewModel, SettingsUiState>(
  () => AppSettingsViewModel(),
);
