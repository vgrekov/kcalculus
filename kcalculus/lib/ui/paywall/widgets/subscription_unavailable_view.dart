import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class SubscriptionUnavailableView extends StatelessWidget {
  const SubscriptionUnavailableView({
    super.key,
    required this.onCheckAgain,
  });

  final void Function() onCheckAgain;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  l10n(context).messageSubscriptionCheckError,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onCheckAgain,
                child: Text(
                  l10n(context).actionCheckSubscriptionAgain,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
