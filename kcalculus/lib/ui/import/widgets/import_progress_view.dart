import 'package:flutter/material.dart';
import 'package:kcalculus/domain/import/models/import_progress.dart';
import 'package:kcalculus/utils/l10n.dart';

class ImportProgressView extends StatelessWidget {
  const ImportProgressView({
    super.key,
    required this.label,
    required this.progress,
  });

  final String label;

  final ImportProgress progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 32),
        Text(
          progress.total != null
              ? l10n(context).mOfN(progress.imported, progress.total!)
              : progress.imported.toString(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
