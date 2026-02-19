import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/import/models/import_record.dart';
import 'package:kcalculus/domain/import/models/import_state.dart';
import 'package:kcalculus/domain/import/use_cases/import_use_case.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/import/view_models/import_ui_state.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('ImportViewModel');

enum ImportCommand {
  showUnknownErrorNotification,
}

class ImportViewModel extends AsyncNotifier<ImportUiState> {
  UiCommander<ImportCommand>? _commander;

  bool _isImportRunning = false;

  @override
  FutureOr<ImportUiState> build() async {
    _commander = UiCommander<ImportCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    final importProcess = await ref.watch(
      importUseCaseProvider.selectAsync((p) => p),
    );

    return ImportUiState(
      importProcess: importProcess,
      isImportRunning: _isImportRunning,
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> runImport() async {
    _log.finer('runImport() START');

    if (_isImportRunning) {
      _log.finer('runImport() Import is already running');
      return;
    }

    ImportRecord? record;

    try {
      _isImportRunning = true;

      final uc = ref.read(importUseCaseProvider.notifier);

      record = await uc.provisionImport();

      if (record == null) return;

      record = record.transitionTo(ImportState.inProgress);
      await uc.saveImport(record);

      _log.finer('runImport() Starting import');

      final report = await uc.runImport();

      _log.info('Import complete');
      _log.eventImport(report);

      record = record
          .transitionTo(ImportState.succeeded)
          .copyWith(report: report);
      await uc.saveImport(record);
    } catch (error, stackTrace) {
      _log.severe('Import failed', error, stackTrace);

      record = await _handleFailedImport(record);
    } finally {
      _isImportRunning = false;
    }

    _log.finer('runImport() END');
  }

  Future<ImportRecord?> _handleFailedImport(ImportRecord? record) async {
    if (record != null) {
      try {
        record = record.transitionTo(ImportState.failed);
        await ref.read(importUseCaseProvider.notifier).saveImport(record);
      } catch (error, stackTrace) {
        _log.severe('Unable to handle failed import', error, stackTrace);

        _commander!.send(ImportCommand.showUnknownErrorNotification);
      }
    }

    return record;
  }

  Future<void> declineImport() async {
    _log.finer('declineImport() START');

    if (_isImportRunning) {
      _log.finer('declineImport() Import is already running');
      return;
    }

    try {
      final uc = ref.read(importUseCaseProvider.notifier);

      var record = await uc.provisionImport();

      if (record == null) return;

      record = record.transitionTo(ImportState.declined);
      await uc.saveImport(record);

      _log.info('Import declined');
    } catch (error, stackTrace) {
      _log.severe('Import decline failed', error, stackTrace);

      _commander!.send(ImportCommand.showUnknownErrorNotification);
    }

    _log.finer('declineImport() END');
  }

  Future<void> acknowledgeImport() async {
    _log.finer('acknowledgeImport() START');

    if (_isImportRunning) {
      _log.finer('acknowledgeImport() Import is running');
      return;
    }

    try {
      final uc = ref.read(importUseCaseProvider.notifier);

      var record = await uc.provisionImport();

      if (record == null) return;

      record = record.transitionTo(ImportState.acknowledged);
      await uc.saveImport(record);

      _log.info('Import acknowledged');
    } catch (error, stackTrace) {
      _log.severe('Import acknowledge failed', error, stackTrace);

      _commander!.send(ImportCommand.showUnknownErrorNotification);
    }

    _log.finer('acknowledgeImport() END');
  }

  Future<void> retryImport() async {
    _log.finer('retryImport() START');

    if (_isImportRunning) {
      _log.finer('retryImport() Import is running');
      return;
    }

    try {
      final uc = ref.read(importUseCaseProvider.notifier);

      var record = await uc.provisionImport();

      if (record == null) return;

      record = record.transitionTo(ImportState.booked);
      await uc.saveImport(record);

      _log.info('Import marked for retry');
    } catch (error, stackTrace) {
      _log.severe('Import retry failed', error, stackTrace);

      _commander!.send(ImportCommand.showUnknownErrorNotification);
    }

    _log.finer('retryImport() END');
  }

  Future<void> revertImport() async {
    _log.finer('revertImport() START');

    if (_isImportRunning) {
      _log.finer('revertImport() Import is running');
      return;
    }

    try {
      final uc = ref.read(importUseCaseProvider.notifier);

      var record = await uc.provisionImport();

      if (record == null) return;

      _log.finer('revertImport() Starting Firestore purge');

      await uc.purgeFirestore();

      _log.info('Firestore purge complete');

      record = record.transitionTo(ImportState.reverted);
      await uc.saveImport(record);

      _log.info('Import reverted');
    } catch (error, stackTrace) {
      _log.severe('Import revert failed', error, stackTrace);

      _commander!.send(ImportCommand.showUnknownErrorNotification);
    }

    _log.finer('revertImport() END');
  }

  Future<void> ignoreImport() async {
    _log.finer('ignoreImport() START');

    if (_isImportRunning) {
      _log.finer('ignoreImport() Import is running');
      return;
    }

    try {
      final uc = ref.read(importUseCaseProvider.notifier);

      var record = await uc.provisionImport();

      if (record == null) return;

      record = record.transitionTo(ImportState.ignored);
      await uc.saveImport(record);

      _log.info('Import ignored');
    } catch (error, stackTrace) {
      _log.severe('Import ignore failed', error, stackTrace);

      _commander!.send(ImportCommand.showUnknownErrorNotification);
    }

    _log.finer('ignoreImport() END');
  }
}

final importViewModel = AsyncNotifierProvider<ImportViewModel, ImportUiState>(
  ImportViewModel.new,
);
