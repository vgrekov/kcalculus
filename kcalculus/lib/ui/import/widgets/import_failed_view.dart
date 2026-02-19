import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class ImportFailedView extends StatelessWidget {
  const ImportFailedView({
    super.key,
    required this.onRetryImport,
    required this.onRevertImport,
    required this.onIgnoreImport,
  });

  final void Function() onRetryImport;

  final void Function() onRevertImport;

  final void Function() onIgnoreImport;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              l10n(context).importFailedTitle,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Text(
            l10n(context).importFailedMessage,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onRetryImport,
              child: Text(
                l10n(context).actionRetryImport,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onRevertImport,
              child: Text(
                l10n(context).actionRevertImport,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onIgnoreImport,
              child: Text(
                l10n(context).actionIgnoreImport,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
