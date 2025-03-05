import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/app_settings.dart';
import 'package:kcalculus/utils/l10n.dart';

class AppThemeSettingTile extends StatelessWidget {
  const AppThemeSettingTile({
    super.key,
    this.theme,
    this.onTap,
  });

  final AppTheme? theme;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        Icons.format_paint,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Row(
        children: [
          Text(
            l10n(context).settingAppTheme,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const Spacer(),
          Text(
            theme?.localName(l10n(context)) ?? '',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
