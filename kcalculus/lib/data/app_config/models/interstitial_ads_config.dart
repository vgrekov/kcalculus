import 'package:freezed_annotation/freezed_annotation.dart';

part 'interstitial_ads_config.freezed.dart';
part 'interstitial_ads_config.g.dart';

@freezed
sealed class InterstitialAdsConfig with _$InterstitialAdsConfig {
  const factory InterstitialAdsConfig({
    required String unitId,
    required int timeoutMillis,
    required int cooldownDurationMins,
    required double probability,
  }) = _InterstitialAdsConfig;

  factory InterstitialAdsConfig.fromJson(Map<String, dynamic> json) =>
      _$InterstitialAdsConfigFromJson(json);
}
