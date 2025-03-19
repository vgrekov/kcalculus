import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/view_models/ad_view_model.dart';

Future<void> showInterstitialAd(WidgetRef ref) async {
  final ad = await ref.read(adViewModel.notifier).loadInterstitialAd();

  if (ad != null) {
    return ad.show();
  }
}
