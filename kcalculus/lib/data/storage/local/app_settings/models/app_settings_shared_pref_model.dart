import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';

part 'app_settings_shared_pref_model.freezed.dart';

@freezed
sealed class AppSettingsSharedPrefModel with _$AppSettingsSharedPrefModel {
  const AppSettingsSharedPrefModel._();

  const factory AppSettingsSharedPrefModel({
    String? themeName,
    bool? crashlyticsEnabled,
    bool? analyticsEnabled,
    int? signedAgreementVersion,
    bool? scannerDisclaimerEnabled,
  }) = _AppSettingsSharedPrefModel;

  factory AppSettingsSharedPrefModel.fromDomain(AppSettings settings) =>
      AppSettingsSharedPrefModel(
        themeName: settings.theme.name,
        crashlyticsEnabled: settings.crashlyticsEnabled,
        analyticsEnabled: settings.analyticsEnabled,
        signedAgreementVersion: settings.signedAgreementVersion,
        scannerDisclaimerEnabled: settings.scannerDisclaimerEnabled,
      );

  AppSettings toDomain() => AppSettings(
        theme: AppTheme.values.where((t) => t.name == themeName).firstOrNull ??
            AppTheme.system,
        crashlyticsEnabled: crashlyticsEnabled,
        analyticsEnabled: analyticsEnabled,
        signedAgreementVersion: signedAgreementVersion,
        scannerDisclaimerEnabled: scannerDisclaimerEnabled ?? true,
      );
}
