import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/repositories/user_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/app_settings_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/domain/providers.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_state.dart';
import 'package:kcalculus/ui/agreement/view_models/agreement_view_model.dart';
import 'package:kcalculus/ui/app/view_models/app_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('AppViewModel');

Future<bool> _isInAgreementStage(Ref ref) async {
  final settings = await ref.read(appSettingsRepositoryProvider.future);

  return settings.signedAgreementVersion == null ||
      settings.signedAgreementVersion! < kAgreementVersion;
}

Future<bool> _isInDataSharingConsentStage(Ref ref) async {
  final settings = await ref.read(appSettingsRepositoryProvider.future);

  return settings.crashlyticsEnabled == null ||
      settings.analyticsEnabled == null;
}

Future<bool> _isInMaintenanceStage(Ref ref) async {
  final maintenanceState = ref.read(maintenanceUseCaseProvider);
  return maintenanceState is! MaintenanceComplete;
}

Future<bool> _isInAuthenticationStage(Ref ref) async {
  final user = await ref.read(userRepositoryProvider.future);
  final userRepository = ref.read(userRepositoryProvider.notifier);

  return user == null && !(await userRepository.isAnonymousModeSelected());
}

final _appUiStateProvider = FutureProvider<AppUiState>(
  (ref) async {
    ref.watch(maintenanceUseCaseProvider);
    ref.watch(userRepositoryProvider);

    final settings = await ref.watch(appSettingsRepositoryProvider.future);

    AppStage? stage;
    if (await _isInAgreementStage(ref)) {
      stage = AppStage.agreement;
    } else if (await _isInDataSharingConsentStage(ref)) {
      stage = AppStage.dataSharingConsent;
    } else if (await _isInMaintenanceStage(ref)) {
      stage = AppStage.maintenance;
    } else if (await _isInAuthenticationStage(ref)) {
      stage = AppStage.authentication;
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
        _toggleAnalytics(settings);
      },
    );
  }

  void _toggleCrashlyticsIfNeeded(AppSettings settings) {
    final settingEnabled = settings.crashlyticsEnabled ?? false;

    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled !=
        settingEnabled) {
      FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(settingEnabled);

      _log.info('crashlyticsEnabled: $settingEnabled');
    }
  }

  void _toggleAnalytics(AppSettings settings) {
    final settingEnabled = settings.analyticsEnabled ?? false;

    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(settingEnabled);

    _log.info('analyticsEnabled: $settingEnabled');
  }
}

final appViewModel = AsyncNotifierProvider<AppViewModel, AppUiState>(
  AppViewModel.new,
);
