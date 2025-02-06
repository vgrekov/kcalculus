import 'package:flutter/material.dart';

class SwitchSettingTile extends StatelessWidget {
  const SwitchSettingTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.icon,
  });

  final bool value;

  final void Function(bool) onChanged;

  final String title;

  final String? subtitle;

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChanged(!value);
      },
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
