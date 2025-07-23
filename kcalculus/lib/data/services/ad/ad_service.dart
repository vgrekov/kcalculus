import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/data/services/app_config/app_config.dart';
import 'package:kcalculus/utils/datetime.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = Logger('AdService');

class AdService {
  const AdService({
    AppConfig? appConfig,
  }) : _appConfig = appConfig;

  /// For Android: ERROR_CODE_NO_FILL (3)
  /// For iOS: GADErrorNoFill (1)
  static final _kErrorCodeNoFill = Platform.isAndroid ? 3 : 1;

  static const _kInterstitialAdLoadedAt = 'kInterstitialAdLoadedAt';

  static const _kInterstitialAdProbability = 0.5;

  static final _randomizer = Random();

  final AppConfig? _appConfig;

  Future<InterstitialAd?> loadInterstitialAd() async {
    if (_appConfig == null) {
      _log.info('Unable to load ads due to no app config');
      return null;
    }

    if (!_appConfig.adsEnabled) {
      _log.finer('Ads disabled');
      return null;
    }

    final cooldownOver =
        await _isCooldownOver(_appConfig.interstitialAdCooldownDurationMins);
    if (!cooldownOver) {
      _log.finer('Still cooling down interstitial ads');
      return null;
    }

    if (_kInterstitialAdProbability < _randomizer.nextDouble()) {
      _log.finer('Skipping interstitial ad on a chance');
      return null;
    }

    final completer = Completer<InterstitialAd?>();

    final adUnitId = _appConfig.interstitialAdUnitId;

    _startTimeout(completer, _appConfig.interstitialAdTimeoutMillis);

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

  Future<bool> _isCooldownOver(int cooldownDurationMins) async {
    final prefs = await SharedPreferences.getInstance();

    final loadedAtStr = prefs.getString(_kInterstitialAdLoadedAt);

    if (loadedAtStr != null) {
      final loadedAt = parseISO8601(loadedAtStr);
      final durationMins = DateTime.now().difference(loadedAt).inMinutes;
      if (durationMins < cooldownDurationMins) {
        return false;
      }
    }

    return true;
  }

  Future<RewardedAd?> loadUnlockAd() async {
    if (_appConfig == null) {
      _log.info('Unable to load ads due to no app config');
      return null;
    }

    if (!_appConfig.adsEnabled) {
      _log.finer('Ads disabled');
      return null;
    }

    final completer = Completer<RewardedAd?>();

    final adUnitId = _appConfig.unlockAdUnitId;

    _startTimeout(completer, _appConfig.unlockAdTimeoutMillis);

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
