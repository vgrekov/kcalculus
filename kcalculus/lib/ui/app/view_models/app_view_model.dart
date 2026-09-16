import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/repositories/subscription_repository.dart';
import 'package:kcalculus/data/auth/auth.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:kcalculus/domain/import/models/import_process.dart';
import 'package:kcalculus/domain/import/use_cases/import_use_case.dart';
import 'package:kcalculus/domain/maintenance/models/maintenance_state.dart';
import 'package:kcalculus/domain/maintenance/use_cases/maintenance_use_case.dart';
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

Future<bool> _isInImportStage(Ref ref) async {
  final importProcess = await ref.read(importUseCaseProvider.future);

  return switch (importProcess) {
    ImportProcessUnavailable _ || ImportProcessIdle _ => false,
    _ => true,
  };
}

Future<bool> _isInPaywallStage(Ref ref) async {
  final subscriptionState = await ref.read(
    subscriptionRepositoryProvider.future,
  );

  return subscriptionState is SubscriptionInactive;
}

final _appUiStateProvider = FutureProvider<AppUiState>(
  (ref) async {
    ref.watch(maintenanceUseCaseProvider);
    ref.watch(userRepositoryProvider);
    ref.watch(appSettingsRepositoryProvider);
    ref.watch(importUseCaseProvider);
    ref.watch(subscriptionRepositoryProvider);

    final settings = await ref.read(appSettingsRepositoryProvider.future);

    AppStage? stage;
    if (await _isInMaintenanceStage(ref)) {
      stage = AppStage.maintenance;
    } else if (await _isInAuthenticationStage(ref)) {
      stage = AppStage.authentication;
    } else if (await _isInAgreementStage(ref)) {
      stage = AppStage.agreement;
    } else if (await _isInDataSharingConsentStage(ref)) {
      stage = AppStage.dataSharingConsent;
    } else if (await _isInImportStage(ref)) {
      stage = AppStage.import;
    } else if (await _isInPaywallStage(ref)) {
      stage = AppStage.paywall;
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

    return ref.watch(_appUiStateProvider.selectAsync((uiState) => uiState));
  }

  void _onAppSettingsChanged(
    AsyncValue<AppSettings>? prev,
    AsyncValue<AppSettings> next,
  ) {
    next.whenData(
      (nextValue) {
        final prevValue = prev?.valueOrNull;

        if (nextValue.crashlyticsEnabled != prevValue?.crashlyticsEnabled) {
          _toggleCrashlyticsIfNeeded(nextValue.crashlyticsEnabled);
        }

        if (nextValue.analyticsEnabled != prevValue?.analyticsEnabled) {
          _toggleAnalytics(nextValue.analyticsEnabled);
        }
      },
    );
  }

  void _toggleCrashlyticsIfNeeded(bool? enabled) {
    final settingEnabled = enabled ?? false;

    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled !=
        settingEnabled) {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        settingEnabled,
      );
    }

    _log.info('crashlyticsEnabled: $settingEnabled');
  }

  void _toggleAnalytics(bool? enabled) {
    final settingEnabled = enabled ?? false;

    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(settingEnabled);

    _log.info('analyticsEnabled: $settingEnabled');
  }
}

final appViewModel = AsyncNotifierProvider<AppViewModel, AppUiState>(
  AppViewModel.new,
);
