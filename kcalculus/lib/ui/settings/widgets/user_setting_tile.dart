import 'package:flutter/material.dart';
import 'package:kcalculus/domain/auth/models/user.dart';
import 'package:kcalculus/ui/settings/widgets/user_actions_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class UserSettingTile extends StatelessWidget {
  const UserSettingTile({
    super.key,
    this.user,
    this.onLogin,
    this.onLogout,
    this.onDeleteAccount,
  });

  final User? user;

  final void Function()? onLogin;

  final void Function()? onLogout;

  final void Function()? onDeleteAccount;

  void _showUserActions(BuildContext context) async {
    if (user != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserActionsScreen(
            user: user!,
            onLogout: onLogout,
            onDeleteAccount: onDeleteAccount,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: user == null
          ? onLogin
          : () {
              _showUserActions(context);
            },
      leading: Icon(
        Icons.person,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        user?.displayName ?? l10n(context).actionLogin,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: user == null
          ? null
          : Text(
              user!.email,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
      trailing: user == null
          ? null
          : Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSurface,
              size: 16,
            ),
    );
  }
}
