import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class ScannerTryAgain extends StatelessWidget {
  const ScannerTryAgain({
    super.key,
    required this.onTryAgain,
  });

  final void Function() onTryAgain;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      onPressed: onTryAgain,
      icon: Icon(
        Icons.refresh,
        color: Theme.of(context).colorScheme.onErrorContainer,
      ),
      label: Text(
        l10n(context).actionTryAgain,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    );
  }
}
