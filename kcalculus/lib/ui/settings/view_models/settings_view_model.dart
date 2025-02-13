import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:logging/logging.dart';

final _log = Logger('AppSettingsViewModel');

enum AppSettingsCommand {
  shareBackup,
  showBackupFailureNotification,
  showRestoreSuccessNotification,
  showRestoreFailureNotification,
}

class AppSettingsViewModel extends AutoDisposeAsyncNotifier<AppSettings> {
  UiCommander<AppSettingsCommand>? _commander;

  @override
  FutureOr<AppSettings> build() {
    _commander = UiCommander<AppSettingsCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return ref.watch(appSettingsRepositoryProvider.future);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> setTheme(AppTheme theme) async {
    final repository = ref.read(appSettingsRepositoryProvider.notifier);
    await repository.setSettings(
      state.value!.copyWith(
        theme: theme,
      ),
    );
  }

  Future<void> setCrashlyticsEnabled(bool enabled) async {
    final repository = ref.read(appSettingsRepositoryProvider.notifier);
    await repository.setSettings(
      state.value!.copyWith(
        crashlyticsEnabled: enabled,
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

      _commander!.send<String, void>(
        AppSettingsCommand.shareBackup,
        payload: backupFile.path,
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
    AsyncNotifierProvider.autoDispose<AppSettingsViewModel, AppSettings>(
  () => AppSettingsViewModel(),
);
