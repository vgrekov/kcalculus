import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_config.freezed.dart';
part 'auth_config.g.dart';

const kDefaultEmailVerificationCooldownDurationSecs = 60;

@freezed
sealed class AuthConfig with _$AuthConfig {
  const factory AuthConfig({
    @Default(kDefaultEmailVerificationCooldownDurationSecs)
    int emailVerificationCooldownDurationSecs,
  }) = _AuthConfig;

  factory AuthConfig.fromJson(Map<String, dynamic> json) =>
      _$AuthConfigFromJson(json);
}
