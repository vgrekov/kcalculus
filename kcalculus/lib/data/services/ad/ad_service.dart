import 'dart:async';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';

final _log = Logger('AdService');

class AdService {
  const AdService({
    required String androidInterstitialAdUnitId,
    required String iOsInterstitialAdUnitId,
    required String androidUnlockAdUnitId,
    required String iOsUnlockAdUnitId,
  })  : _androidInterstitialAdUnitId = androidInterstitialAdUnitId,
        _iOsInterstitialAdUnitId = iOsInterstitialAdUnitId,
        _androidUnlockAdUnitId = androidUnlockAdUnitId,
        _iOsUnlockAdUnitId = iOsUnlockAdUnitId;

  /// For Android: ERROR_CODE_NO_FILL (3)
  /// For iOS: GADErrorNoFill (1)
  static final _kErrorCodeNoFill = Platform.isAndroid ? 3 : 1;

  final String _androidInterstitialAdUnitId;

  final String _iOsInterstitialAdUnitId;

  final String _androidUnlockAdUnitId;

  final String _iOsUnlockAdUnitId;

  Future<InterstitialAd?> loadInterstitialAd() {
    final completer = Completer<InterstitialAd?>();

    final adUnitId = Platform.isAndroid
        ? _androidInterstitialAdUnitId
        : _iOsInterstitialAdUnitId;

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          completer.complete(ad);
        },
        onAdFailedToLoad: (error) {
          _log.info('Failed to load Ad: $adUnitId (error code ${error.code})');
          if (error.code == _kErrorCodeNoFill) {
            completer.complete(null);
          } else {
            completer.completeError(error);
          }
        },
      ),
    );

    return completer.future;
  }
}
