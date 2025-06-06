abstract interface class AppConfig {
  String get openFoodFactsBaseUrl;

  int get openFoodFactsTimeoutMillis;

  String get contactEmail;

  String get androidInterstitialAdUnitId;

  String get iOsInterstitialAdUnitId;

  int get interstitialAdTimeoutMillis;

  String get androidUnlockAdUnitId;

  String get iOsUnlockAdUnitId;

  int get unlockAdTimeoutMillis;

  int get unlockWithAdDurationMins;

  int get interstitialAdCooldownDurationMins;
}
