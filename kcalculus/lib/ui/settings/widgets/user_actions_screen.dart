import 'package:flutter/material.dart';
import 'package:kcalculus/domain/auth/models/user.dart';
import 'package:kcalculus/ui/settings/widgets/action_setting_tile.dart';
import 'package:kcalculus/ui/settings/widgets/settings_group.dart';
import 'package:kcalculus/utils/l10n.dart';

class UserActionsScreen extends StatelessWidget {
  const UserActionsScreen({
    super.key,
    required this.user,
    this.onLogout,
    this.onDeleteAccount,
  });

  final User user;

  final void Function()? onLogout;

  final void Function()? onDeleteAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user.displayName ?? user.email,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              user.displayName != null ? user.email : '',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SettingsGroup(
            children: [
              ActionSettingTile(
                onTap: onLogout,
                title: l10n(context).settingLogoutTitle,
                subtitle: l10n(context).settingLogoutSubtitle,
                icon: Icons.logout,
              ),
              ActionSettingTile(
                onTap: onDeleteAccount,
                title: l10n(context).settingDeleteAccountTitle,
                subtitle: l10n(context).settingDeleteAccountSubtitle,
                icon: Icons.delete_forever,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
