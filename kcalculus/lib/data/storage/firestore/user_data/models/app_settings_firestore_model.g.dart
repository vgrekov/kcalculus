// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettingsFirestoreModel _$AppSettingsFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _AppSettingsFirestoreModel(
      themeName: json['themeName'] as String?,
      crashlyticsEnabled: json['crashlyticsEnabled'] as bool?,
      analyticsEnabled: json['analyticsEnabled'] as bool?,
      signedAgreementVersion: (json['signedAgreementVersion'] as num?)?.toInt(),
      scannerDisclaimerEnabled: json['scannerDisclaimerEnabled'] as bool?,
    );

Map<String, dynamic> _$AppSettingsFirestoreModelToJson(
        _AppSettingsFirestoreModel instance) =>
    <String, dynamic>{
      'themeName': instance.themeName,
      'crashlyticsEnabled': instance.crashlyticsEnabled,
      'analyticsEnabled': instance.analyticsEnabled,
      'signedAgreementVersion': instance.signedAgreementVersion,
      'scannerDisclaimerEnabled': instance.scannerDisclaimerEnabled,
    };
