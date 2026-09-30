import 'package:flutter/material.dart';

class ActionSettingTile extends StatelessWidget {
  const ActionSettingTile({
    super.key,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
  });

  final void Function()? onTap;

  final String title;

  final String? subtitle;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final leading = Icon(
      leadingIcon,
      color: Theme.of(context).colorScheme.onSurface,
    );

    final trailing = Icon(
      trailingIcon,
      color: Theme.of(context).colorScheme.onSurface,
    );

    return ListTile(
      onTap: onTap,
      leading: leading,
      trailing: trailing,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
    );
  }
}
