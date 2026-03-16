import 'package:freezed_annotation/freezed_annotation.dart';

part 'unlock_ads_config.freezed.dart';
part 'unlock_ads_config.g.dart';

@freezed
sealed class UnlockAdsConfig with _$UnlockAdsConfig {
  const factory UnlockAdsConfig({
    required String unitId,
    required int timeoutMillis,
    required int rewardDurationMins,
  }) = _UnlockAdsConfig;

  factory UnlockAdsConfig.fromJson(Map<String, dynamic> json) =>
      _$UnlockAdsConfigFromJson(json);
}
