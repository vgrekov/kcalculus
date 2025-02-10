import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class ReleaseErrorWidget extends StatelessWidget {
  const ReleaseErrorWidget(
    this.details, {
    super.key,
  });

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        l10n(context).messageUnknownError,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
      ),
    );
  }
}
