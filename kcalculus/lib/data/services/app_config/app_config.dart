import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
sealed class AppConfig with _$AppConfig {
  const factory AppConfig({
    required String openFoodFactsBaseUrl,
    required int openFoodFactsTimeoutMillis,
    required String contactEmail,
    required String interstitialAdUnitId,
    required int interstitialAdTimeoutMillis,
    required int interstitialAdCooldownDurationMins,
    required String unlockAdUnitId,
    required int unlockAdTimeoutMillis,
    required int unlockWithAdDurationMins,
    required bool adsEnabled,
    @Default(60) int emailVerificationCooldownDurationSecs,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
