import 'package:flutter/material.dart';

class MoreGridItem extends StatelessWidget {
  const MoreGridItem({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final Widget image;

  final String title;

  final String? subtitle;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerLow.withValues(alpha: 0.8),
            title: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            subtitle: subtitle == null
                ? null
                : Center(
                    child: Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: image,
          ),
        ),
      ),
    );
  }
}
