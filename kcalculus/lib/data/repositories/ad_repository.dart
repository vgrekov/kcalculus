import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/data/services/ad/ad_service.dart';

class AdRepository {
  const AdRepository({
    required AdService service,
  }) : _service = service;

  final AdService _service;

  Future<InterstitialAd?> loadInterstitialAd() {
    return _service.loadInterstitialAd();
  }

  Future<RewardedAd?> loadUnlockAd() {
    return _service.loadUnlockAd();
  }
}
