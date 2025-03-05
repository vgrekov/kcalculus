import 'package:flutter/material.dart';

class ActionSettingTile extends StatelessWidget {
  const ActionSettingTile({
    super.key,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.icon,
  });

  final void Function()? onTap;

  final String title;

  final String? subtitle;

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
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
