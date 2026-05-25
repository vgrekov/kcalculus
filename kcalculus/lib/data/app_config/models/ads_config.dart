import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/app_config/models/interstitial_ads_config.dart';
import 'package:kcalculus/data/app_config/models/unlock_ads_config.dart';

part 'ads_config.freezed.dart';
part 'ads_config.g.dart';

@freezed
sealed class AdsConfig with _$AdsConfig {
  const factory AdsConfig({
    @Default(true) bool enabled,
    required InterstitialAdsConfig interstitial,
    required UnlockAdsConfig unlock,
  }) = _AdsConfig;

  factory AdsConfig.fromJson(Map<String, dynamic> json) =>
      _$AdsConfigFromJson(json);
}
