import 'package:flutter/material.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

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
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      subtitle: searchResult.lastEatenAt == null
          ? null
          : Text(
              dt.formatDate(searchResult.lastEatenAt!),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
      trailing: Text(
        searchResult.type.name.toUpperCase(),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
      ),
    );
  }
}
