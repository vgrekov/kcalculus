import 'package:google_mobile_ads/google_mobile_ads.dart';

sealed class PremiumStatus {
  const PremiumStatus();
}

class PremiumDenied extends PremiumStatus {
  const PremiumDenied();
}

class PremiumGranted extends PremiumStatus {
  const PremiumGranted();
}

class PremiumGrantedWithAd extends PremiumStatus {
  const PremiumGrantedWithAd(this.ad);

  final RewardedAd ad;
}

class PremiumUnavailable extends PremiumStatus {
  const PremiumUnavailable();
}
