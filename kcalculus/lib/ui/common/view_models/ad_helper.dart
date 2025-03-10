import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:logging/logging.dart';

final _log = Logger('AdHelper');

class AdHelper {
  const AdHelper({
    required Ref Function() getRef,
  }) : _getRef = getRef;

  final Ref Function() _getRef;

  Future<void> showInterstitialAd() async {
    try {
      final adRepository = await _getRef().read(adRepositoryProvider.future);

      final ad = await adRepository.loadInterstitialAd();

      if (ad == null) {
        return;
      }

      final completer = Completer<void>();

      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdImpression: (ad) {
          _log.info('Ad impression occurred: ${ad.adUnitId}');
        },
        onAdClicked: (ad) {
          _log.info('Ad clicked: ${ad.adUnitId}');
        },
        onAdDismissedFullScreenContent: (ad) {
          completer.complete();

          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          _log.severe('Failed to show an Ad', error);

          completer.complete();

          ad.dispose();
        },
      );

      ad.show();

      return completer.future;
    } catch (error, stackTrace) {
      _log.severe('Failed to show an Ad', error, stackTrace);
    }
  }
}
