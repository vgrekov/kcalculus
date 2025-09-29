import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kcalculus/data/access/repositories/access_level_repository.dart';
import 'package:kcalculus/data/ad/repositories/ad_repository.dart';
import 'package:kcalculus/domain/_common/models/access_level.dart';
import 'package:kcalculus/ui/access_guard/view_models/premium_status.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('AccessGuardViewModel');

enum AccessGuardCommand {
  showUnknownErrorNotification,
  confirmUnlockWithAd,
  showUnlockedMessage,
  showPremiumUnavailableMessage,
  showProgress,
  hideProgress,
}

class AccessGuardViewModel extends AutoDisposeFamilyNotifier<void, Key?> {
  UiCommander<AccessGuardCommand>? _commander;

  @override
  void build(Key? arg) {
    _commander = UiCommander<AccessGuardCommand>(_commander);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<PremiumStatus> checkPremiumStatus() async {
    _log.finer('Checking premium status');

    try {
      _commander!.send(AccessGuardCommand.showProgress);

      final accessLevel = await ref.read(accessLevelRepositoryProvider.future);

      switch (accessLevel) {
        case AccessLevelPremium():
        case AccessLevelAdSupportedPremium():
          _log.finer('Premium granted');
          return const PremiumGranted();
        case AccessLevelFreeNoAds():
          _log.finer('Premium unavailable');

          _commander!.send(AccessGuardCommand.showPremiumUnavailableMessage);

          return const PremiumUnavailable();
        default:
      }

      final adRepository = ref.read(adRepositoryProvider.notifier);

      final ad = await adRepository.loadUnlockAd();

      _commander!.send(AccessGuardCommand.hideProgress);

      if (ad == null) {
        _log.info('No Ad to show, rewarding premium');
        _log.eventNoAd();

        await rewardPremium();

        return const PremiumGranted();
      }

      final confirmed = await _commander!
          .send<void, bool>(AccessGuardCommand.confirmUnlockWithAd);

      if (!confirmed) {
        ad.dispose();

        return const PremiumDenied();
      }

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
          _log.severe('Failed to show an Ad: ${ad.adUnitId}', error);

          ad.dispose();

          _commander!.send(AccessGuardCommand.showUnknownErrorNotification);
        },
      );

      return PremiumGrantedWithAd(ad);
    } catch (error, stackTrace) {
      _log.severe('Failed to check premium status', error, stackTrace);

      _commander!.send(AccessGuardCommand.showUnknownErrorNotification);

      return const PremiumGranted();
    } finally {
      _commander!.send(AccessGuardCommand.hideProgress);
    }
  }

  Future<void> rewardPremium() async {
    _log.info('Premium reward earned');
    _log.eventPremiumRewardEarned();

    try {
      final accessLevelRepository =
          ref.read(accessLevelRepositoryProvider.notifier);

      final until = await accessLevelRepository.rewardUnlock();

      _commander!.send<DateTime, void>(
        AccessGuardCommand.showUnlockedMessage,
        payload: until,
      );

      _log.finer('Premium reward granted');
    } catch (error, stackTrace) {
      _log.severe('Failed to reward premium', error, stackTrace);

      _commander!.send(AccessGuardCommand.showUnknownErrorNotification);
    }
  }
}

final accessGuardViewModel =
    NotifierProvider.family.autoDispose<AccessGuardViewModel, void, Key?>(
  AccessGuardViewModel.new,
);
