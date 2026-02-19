import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class ImportInProgressView extends StatelessWidget {
  const ImportInProgressView({
    super.key,
    this.isRunning = false,
    required this.onContactSupport,
  });

  final bool isRunning;

  final void Function() onContactSupport;

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
              isRunning
                  ? l10n(context).importRunningTitle
                  : l10n(context).importStuckTitle,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Text(
            isRunning
                ? l10n(context).importRunningMessage
                : l10n(context).importStuckMessage,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          if (isRunning) ...[
            const SizedBox(height: 32),
            LinearProgressIndicator(
              minHeight: 8,
            ),
          ],
          const Spacer(),
          if (!isRunning)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onContactSupport,
                child: Text(
                  l10n(context).actionContactSupport,
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
