import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/repositories/subscription_repository.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

final _log = Logger('PremiumSettingTile');

class PremiumSettingTile extends ConsumerStatefulWidget {
  const PremiumSettingTile({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PremiumSettingTileState();
  }
}

class _PremiumSettingTileState extends ConsumerState<PremiumSettingTile> {
  void _openCustomerCenter() async {
    await RevenueCatUI.presentCustomerCenter();
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionStateAsync = ref.watch(subscriptionRepositoryProvider);

    String subtitle = '';
    Color bgColor = Theme.of(context).colorScheme.tertiaryContainer;
    Color fgColor = Theme.of(context).colorScheme.onTertiaryContainer;

    switch (subscriptionStateAsync) {
      case AsyncData(value: final subscriptionState):
        subtitle = switch (subscriptionState) {
          SubscriptionActive active =>
            l10n(context).settingPremiumSubtitleSubscriptionActive(
              active.isTrial.toString(),
              active.expirationDate != null
                  ? dt.formatDateTimeLocal(context, active.expirationDate!)
                  : '',
              (active.expirationDate != null).toString(),
            ),
          _ => l10n(context).settingPremiumSubtitleSubscriptionInactive,
        };

        break;

      case AsyncError(:final error, :final stackTrace):
        _log.severe('Failed to load subscription state', error, stackTrace);

        subtitle = l10n(context).settingPremiumSubtitleSubscriptionFailedToLoad;

        bgColor = Theme.of(context).colorScheme.errorContainer;
        fgColor = Theme.of(context).colorScheme.onErrorContainer;

        break;

      default:
    }

    return ListTile(
      onTap: _openCustomerCenter,
      leading: Icon(
        Icons.diamond,
        color: fgColor,
      ),
      title: Text(
        l10n(context).settingPremiumTitle,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: fgColor),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: fgColor,
        ),
      ),
      tileColor: bgColor,
    );
  }
}
