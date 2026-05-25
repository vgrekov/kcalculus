import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class ImportErrorView extends StatelessWidget {
  const ImportErrorView({super.key});

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
