// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthConfig _$AuthConfigFromJson(Map<String, dynamic> json) => _AuthConfig(
  emailVerificationCooldownDurationSecs:
      (json['emailVerificationCooldownDurationSecs'] as num?)?.toInt() ??
      kDefaultEmailVerificationCooldownDurationSecs,
);

Map<String, dynamic> _$AuthConfigToJson(_AuthConfig instance) =>
    <String, dynamic>{
      'emailVerificationCooldownDurationSecs':
          instance.emailVerificationCooldownDurationSecs,
    };
