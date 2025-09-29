import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/data/ad/ad.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('AdViewModel');

class AdViewModel extends Notifier<void> {
  @override
  void build() {}

  Future<InterstitialAd?> loadInterstitialAd() async {
    try {
      final adRepository = ref.read(adRepositoryProvider.notifier);

      final ad = await adRepository.loadInterstitialAd();

      if (ad != null) {
        ad.fullScreenContentCallback = FullScreenContentCallback(
          onAdImpression: (ad) {
            _log.info('Ad impression occurred: ${ad.adUnitId}');
            _log.eventAdImpression(ad);
          },
          onAdClicked: (ad) {
            _log.info('Ad clicked: ${ad.adUnitId}');
            _log.eventAdClicked(ad);
          },
          onAdDismissedFullScreenContent: (ad) {
            _log.finer('Ad dismissed: ${ad.adUnitId}');

            ad.dispose();
          },
          onAdFailedToShowFullScreenContent: (ad, error) {
            _log.severe('Failed to show an Ad', error);

            ad.dispose();
          },
        );
      }

      return ad;
    } catch (error, stackTrace) {
      _log.severe('Failed to load an Ad', error, stackTrace);

      return null;
    }
  }
}

final adViewModel = NotifierProvider<AdViewModel, void>(
  AdViewModel.new,
);
