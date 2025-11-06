import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class DeletedTag extends StatelessWidget {
  const DeletedTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      l10n(context).tagDeleted,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
    );
  }
}
