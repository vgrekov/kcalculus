import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/access/repositories/subscription_repository.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';
import 'package:kcalculus/ui/settings/widgets/subscription_screen.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final _log = Logger('PremiumSettingTile');

class SubscriptionSettingTile extends ConsumerStatefulWidget {
  const SubscriptionSettingTile({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SubscriptionSettingTileState();
  }
}

class _SubscriptionSettingTileState
    extends ConsumerState<SubscriptionSettingTile> {
  void _showSubscriptionScreen(BuildContext context, String appUserId) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SubscriptionScreen(
          appUserId: appUserId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionStateAsync = ref.watch(subscriptionRepositoryProvider);

    String subtitle = '';
    Color bgColor = Theme.of(context).colorScheme.tertiaryContainer;
    Color fgColor = Theme.of(context).colorScheme.onTertiaryContainer;
    void Function()? action;

    switch (subscriptionStateAsync) {
      case AsyncData(value: final subscriptionState):
        subtitle = switch (subscriptionState) {
          SubscriptionActive active => switch (active) {
            SubscriptionActive(billingIssueDetectedAt: _?) =>
              l10n(context).settingPremiumSubtitleSubscriptionBillingIssue(
                active.expirationDate != null
                    ? dt.formatDateTimeLocal(context, active.expirationDate!)
                    : '',
                (active.expirationDate != null).toString(),
              ),
            SubscriptionActive(isTrial: true) =>
              l10n(context).settingPremiumSubtitleSubscriptionTrial(
                active.expirationDate != null
                    ? dt.formatDateTimeLocal(context, active.expirationDate!)
                    : '',
                (active.expirationDate != null).toString(),
              ),
            _ => l10n(context).settingPremiumSubtitleSubscriptionActive(
              active.expirationDate != null
                  ? dt.formatDateTimeLocal(context, active.expirationDate!)
                  : '',
              (active.expirationDate != null).toString(),
              active.isCancelled.toString(),
            ),
          },
          _ => l10n(context).settingPremiumSubtitleSubscriptionInactive,
        };

        action = () {
          _showSubscriptionScreen(context, subscriptionState.appUserId);
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
      onTap: action,
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
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).colorScheme.onSurface,
        size: 16,
      ),
    );
  }
}
