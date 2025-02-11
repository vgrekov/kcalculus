// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      theme: $enumDecode(_$AppThemeEnumMap, json['theme']),
      crashlyticsEnabled: json['crashlyticsEnabled'] as bool?,
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'theme': _$AppThemeEnumMap[instance.theme]!,
      'crashlyticsEnabled': instance.crashlyticsEnabled,
    };

const _$AppThemeEnumMap = {
  AppTheme.system: 'system',
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};
