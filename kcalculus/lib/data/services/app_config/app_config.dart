import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
sealed class AppConfig with _$AppConfig {
  const factory AppConfig({
    required String openFoodFactsBaseUrl,
    required int openFoodFactsTimeoutMillis,
    required String contactEmail,
    required String androidInterstitialAdUnitId,
    required String iOsInterstitialAdUnitId,
    required int interstitialAdTimeoutMillis,
    required String androidUnlockAdUnitId,
    required String iOsUnlockAdUnitId,
    required int unlockAdTimeoutMillis,
    required int unlockWithAdDurationMins,
    required int interstitialAdCooldownDurationMins,
    required bool adsEnabled,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
