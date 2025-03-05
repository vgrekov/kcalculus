import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';

class EdibleSearchResultsItem extends StatelessWidget {
  final EdibleSearchResult searchResult;
  final void Function(EdibleSearchResult) onSelectSearchResult;

  const EdibleSearchResultsItem({
    super.key,
    required this.searchResult,
    required this.onSelectSearchResult,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(searchResult.id),
      onTap: () {
        onSelectSearchResult(searchResult);
      },
      title: Text(
        searchResult.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: searchResult.description.isEmpty
          ? null
          : Text(
              searchResult.description,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            searchResult.lastEatenAt == null
                ? l10n(context).labelNotEatenYet
                : l10n(context).labelLastEatenAt,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          if (searchResult.lastEatenAt != null)
            Text(
              dt.formatDateLocal(context, searchResult.lastEatenAt!),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
        ],
      ),
    );
  }
}
