import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class PagedListEmpty extends StatelessWidget {
  const PagedListEmpty({
    super.key,
    this.noItemsMessage,
  });

  final String? noItemsMessage;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              noItemsMessage ?? l10n(context).messageNoData,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
