import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/services/app_config/app_config.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
sealed class LocalAppConfig with _$LocalAppConfig implements AppConfig {
  const factory LocalAppConfig({
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
  }) = _LocalAppConfig;

  factory LocalAppConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalAppConfigFromJson(json);
}
