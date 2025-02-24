import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_status_repository.dart';
import 'package:kcalculus/data/repositories/maintenance/maintenance_task_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/domain/models/maintenance_status.dart';
import 'package:kcalculus/ui/agreement/view_models/agreement_view_model.dart';
import 'package:kcalculus/ui/app/view_models/app_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('AppViewModel');

final _appUiStateProvider = FutureProvider<AppUiState>(
  (ref) async {
    final settings = await ref.watch(appSettingsRepositoryProvider.future);

    final maintenanceStatus = ref.watch(maintenanceStatusRepository);

    AppStage? stage;
    if (settings.signedAgreementVersion == null ||
        settings.signedAgreementVersion! < kAgreementVersion) {
      stage = AppStage.agreement;
    } else if (settings.crashlyticsEnabled == null) {
      stage = AppStage.dataSharingConsent;
    } else if (maintenanceStatus == MaintenanceStatus.inProgress ||
        maintenanceStatus == MaintenanceStatus.error) {
      stage = AppStage.maintenance;
    } else if (maintenanceStatus == MaintenanceStatus.notStarted) {
      final maintenanceTasks = await ref.read(maintenanceTaskRepository.future);
      if (maintenanceTasks.isNotEmpty) {
        stage = AppStage.maintenance;
      }
    }

    return AppUiState(
      theme: settings.theme,
      stage: stage ?? AppStage.operation,
    );
  },
);

class AppViewModel extends AsyncNotifier<AppUiState> {
  @override
  FutureOr<AppUiState> build() async {
    ref.listen(appSettingsRepositoryProvider, _onAppSettingsChanged);

    ref.listen(_appUiStateProvider, _onAppUiStateChanged);

    return ref.read(_appUiStateProvider.future);
  }

  void _onAppUiStateChanged(
    AsyncValue<AppUiState>? prev,
    AsyncValue<AppUiState> next,
  ) {
    next.whenData((nextValue) {
      if (nextValue != prev?.valueOrNull) {
        state = next;
      }
    });
  }

  void _onAppSettingsChanged(
    AsyncValue<AppSettings>? prev,
    AsyncValue<AppSettings> next,
  ) {
    next.whenData(
      (settings) {
        _toggleCrashlyticsIfNeeded(settings);
      },
    );
  }

  void _toggleCrashlyticsIfNeeded(AppSettings settings) {
    final settingEnabled = settings.crashlyticsEnabled ?? false;

    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled !=
        settingEnabled) {
      FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(settingEnabled);

      _log.info('crashlyticsEnabled: ${settings.crashlyticsEnabled}');
    }
  }
}

final appViewModel = AsyncNotifierProvider<AppViewModel, AppUiState>(
  AppViewModel.new,
);
