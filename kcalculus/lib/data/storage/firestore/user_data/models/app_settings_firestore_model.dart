// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';

part 'app_settings_firestore_model.freezed.dart';
part 'app_settings_firestore_model.g.dart';

@freezed
sealed class AppSettingsFirestoreModel with _$AppSettingsFirestoreModel {
  const AppSettingsFirestoreModel._();

  const factory AppSettingsFirestoreModel({
    String? themeName,
    bool? crashlyticsEnabled,
    bool? analyticsEnabled,
    int? signedAgreementVersion,
    bool? scannerDisclaimerEnabled,
  }) = _AppSettingsFirestoreModel;

  factory AppSettingsFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFirestoreModelFromJson(json);

  factory AppSettingsFirestoreModel.fromDomain(
    AppSettings model,
  ) =>
      AppSettingsFirestoreModel(
        themeName: model.theme.name,
        crashlyticsEnabled: model.crashlyticsEnabled,
        analyticsEnabled: model.analyticsEnabled,
        signedAgreementVersion: model.signedAgreementVersion,
        scannerDisclaimerEnabled: model.scannerDisclaimerEnabled,
      );

  AppSettings toDomain() => AppSettings(
        theme: themeName == null ? AppTheme.system : AppTheme.of(themeName!),
        crashlyticsEnabled: crashlyticsEnabled,
        analyticsEnabled: analyticsEnabled,
        signedAgreementVersion: signedAgreementVersion,
        scannerDisclaimerEnabled: scannerDisclaimerEnabled ?? true,
      );
}
