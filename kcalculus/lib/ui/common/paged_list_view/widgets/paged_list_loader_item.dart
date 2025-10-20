import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/utils/l10n.dart';

class PagedListLoaderItem extends StatelessWidget {
  const PagedListLoaderItem({
    super.key,
    this.pageLoader,
  });

  final Future<dynamic>? pageLoader;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Awaited(
        future: pageLoader,
        loading: (_) => const SizedBox(
          height: 40,
          child: Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        error: (context, _, __) => SizedBox(
          height: 40,
          child: Center(
            child: Text(
              l10n(context).messageUnknownError,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
