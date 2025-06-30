import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/utils/datetime.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = Logger('AdService');

class AdService {
  const AdService({
    required String androidInterstitialAdUnitId,
    required String iOsInterstitialAdUnitId,
    required int interstitialAdTimeoutMillis,
    required String androidUnlockAdUnitId,
    required String iOsUnlockAdUnitId,
    required int unlockAdTimeoutMillis,
    required int interstitialAdCooldownDurationMins,
  })  : _androidInterstitialAdUnitId = androidInterstitialAdUnitId,
        _iOsInterstitialAdUnitId = iOsInterstitialAdUnitId,
        _interstitialAdTimeoutMillis = interstitialAdTimeoutMillis,
        _androidUnlockAdUnitId = androidUnlockAdUnitId,
        _iOsUnlockAdUnitId = iOsUnlockAdUnitId,
        _unlockAdTimeoutMillis = unlockAdTimeoutMillis,
        _interstitialAdCooldownDurationMins =
            interstitialAdCooldownDurationMins;

  /// For Android: ERROR_CODE_NO_FILL (3)
  /// For iOS: GADErrorNoFill (1)
  static final _kErrorCodeNoFill = Platform.isAndroid ? 3 : 1;

  static const _kInterstitialAdLoadedAt = 'kInterstitialAdLoadedAt';

  static const _kInterstitialAdProbability = 0.5;

  static final _randomizer = Random();

  final String _androidInterstitialAdUnitId;

  final String _iOsInterstitialAdUnitId;

  final int _interstitialAdTimeoutMillis;

  final String _androidUnlockAdUnitId;

  final String _iOsUnlockAdUnitId;

  final int _unlockAdTimeoutMillis;

  final int _interstitialAdCooldownDurationMins;

  Future<InterstitialAd?> loadInterstitialAd() async {
    final cooldownOver = await _isCooldownOver();
    if (!cooldownOver) {
      _log.finer('Still cooling down interstitial ads');
      return null;
    }

    if (_kInterstitialAdProbability < _randomizer.nextDouble()) {
      _log.finer('Skipping interstitial ad on a chance');
      return null;
    }

    final completer = Completer<InterstitialAd?>();

    final adUnitId = Platform.isAndroid
        ? _androidInterstitialAdUnitId
        : _iOsInterstitialAdUnitId;

    _startTimeout(completer, _interstitialAdTimeoutMillis);

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(
        nonPersonalizedAds: true,
      ),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if (!completer.isCompleted) {
            completer.complete(ad);
            _startCooldown();
          } else {
            ad.dispose();
          }
        },
        onAdFailedToLoad: (error) {
          _log.info('Failed to load Ad: $adUnitId (error code ${error.code})');
          if (!completer.isCompleted) {
            if (error.code == _kErrorCodeNoFill) {
              completer.complete(null);
            } else {
              completer.completeError(error);
            }
          }
        },
      ),
    );

    return completer.future;
  }

  Future<void> _startCooldown() async {
    _log.finer('Starting interstitial ads cooldown');

    final now = DateTime.now();

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_kInterstitialAdLoadedAt, formatISO8601(now));
  }

  Future<bool> _isCooldownOver() async {
    final prefs = await SharedPreferences.getInstance();

    final loadedAtStr = prefs.getString(_kInterstitialAdLoadedAt);

    if (loadedAtStr != null) {
      final loadedAt = parseISO8601(loadedAtStr);
      final durationMins = DateTime.now().difference(loadedAt).inMinutes;
      if (durationMins < _interstitialAdCooldownDurationMins) {
        return false;
      }
    }

    return true;
  }

  Future<RewardedAd?> loadUnlockAd() async {
    final completer = Completer<RewardedAd?>();

    final adUnitId =
        Platform.isAndroid ? _androidUnlockAdUnitId : _iOsUnlockAdUnitId;

    _startTimeout(completer, _unlockAdTimeoutMillis);

    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(
        nonPersonalizedAds: true,
      ),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          completer.complete(ad);
          _startCooldown();
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

  void _startTimeout<T>(Completer<T> completer, int timeoutMillis) {
    final timeoutDuration = Duration(milliseconds: timeoutMillis);
    Future.delayed(
      timeoutDuration,
      () {
        if (!completer.isCompleted) {
          completer.completeError(TimeoutException(null, timeoutDuration));
        }
      },
    );
  }
}
