// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
      theme: $enumDecode(_$AppThemeEnumMap, json['theme']),
      crashlyticsEnabled: json['crashlyticsEnabled'] as bool?,
      analyticsEnabled: json['analyticsEnabled'] as bool?,
      signedAgreementVersion: (json['signedAgreementVersion'] as num?)?.toInt(),
      scannerDisclaimerEnabled: json['scannerDisclaimerEnabled'] as bool,
    );

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'theme': _$AppThemeEnumMap[instance.theme]!,
      'crashlyticsEnabled': instance.crashlyticsEnabled,
      'analyticsEnabled': instance.analyticsEnabled,
      'signedAgreementVersion': instance.signedAgreementVersion,
      'scannerDisclaimerEnabled': instance.scannerDisclaimerEnabled,
    };

const _$AppThemeEnumMap = {
  AppTheme.system: 'system',
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};
