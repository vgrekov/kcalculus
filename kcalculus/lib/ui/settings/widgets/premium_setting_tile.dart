import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/access_level.dart';
import 'package:kcalculus/ui/access_guard/utils/premium_feature.dart';
import 'package:kcalculus/ui/access_guard/widgets/access_guard.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';

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
  final _accessGuardKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final accessLevel = ref.watch(accessLevelRepositoryProvider);

    final accessLevelValue =
        accessLevel is AsyncData ? accessLevel.value : null;

    return AccessGuard(
      key: _accessGuardKey,
      child: ListTile(
        onTap: accessLevelValue is! AccessLevelFree
            ? null
            : () {
                premiumFeature(ref, _accessGuardKey, () {});
              },
        leading: Icon(
          Icons.diamond,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
        title: Text(
          l10n(context).settingPremiumTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onTertiaryContainer),
        ),
        subtitle: Text(
          switch (accessLevelValue) {
            AccessLevelFree() => l10n(context).settingPremiumSubtitleLocked,
            AccessLevelPremium() =>
              l10n(context).settingPremiumSubtitleUnlocked,
            AccessLevelAdSupportedPremium(:final expirationDate) =>
              l10n(context).settingPremiumSubtitleUnlockedUntil(
                dt.formatDateTimeLocal(context, expirationDate),
              ),
            _ => '',
          },
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
        ),
        tileColor: Theme.of(context).colorScheme.tertiaryContainer,
      ),
    );
  }
}
