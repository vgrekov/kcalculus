import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_shared_pref_model.freezed.dart';

@freezed
class AppSettingsSharedPrefModel with _$AppSettingsSharedPrefModel {
  const factory AppSettingsSharedPrefModel({
    String? themeName,
    bool? crashlyticsEnabled,
    bool? analyticsEnabled,
    int? signedAgreementVersion,
    bool? scannerDisclaimerEnabled,
  }) = _AppSettingsSharedPrefModel;
}
