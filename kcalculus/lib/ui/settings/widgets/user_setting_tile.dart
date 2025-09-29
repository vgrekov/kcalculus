import 'package:flutter/material.dart';
import 'package:kcalculus/domain/auth/models/user.dart';
import 'package:kcalculus/utils/l10n.dart';

class UserSettingTile extends StatelessWidget {
  const UserSettingTile({
    super.key,
    this.user,
    this.onLogin,
    this.onLogout,
  });

  final User? user;

  final void Function()? onLogin;

  final void Function()? onLogout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: user != null ? onLogout : onLogin,
      leading: Icon(
        Icons.person,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        user?.displayName ?? l10n(context).actionLogin,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: user == null
          ? null
          : Text(
              user!.email,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
      trailing: Icon(
        user != null ? Icons.logout : Icons.login,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
