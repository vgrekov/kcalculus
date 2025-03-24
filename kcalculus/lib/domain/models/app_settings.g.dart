// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      theme: $enumDecode(_$AppThemeEnumMap, json['theme']),
      crashlyticsEnabled: json['crashlyticsEnabled'] as bool?,
      analyticsEnabled: json['analyticsEnabled'] as bool?,
      signedAgreementVersion: (json['signedAgreementVersion'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'theme': _$AppThemeEnumMap[instance.theme]!,
      'crashlyticsEnabled': instance.crashlyticsEnabled,
      'analyticsEnabled': instance.analyticsEnabled,
      'signedAgreementVersion': instance.signedAgreementVersion,
    };

const _$AppThemeEnumMap = {
  AppTheme.system: 'system',
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};
