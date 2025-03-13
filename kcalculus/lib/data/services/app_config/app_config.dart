abstract interface class AppConfig {
  String get openFoodFactsBaseUrl;

  String get contactEmail;

  String get androidInterstitialAdUnitId;

  String get iOsInterstitialAdUnitId;

  String get androidUnlockAdUnitId;

  String get iOsUnlockAdUnitId;

  int get unlockWithAdDurationMins;
}
