import 'package:flutter/material.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';
import 'package:kcalculus/ui/edibles/common/edible_search_results/widgets/edible_search_results_item_calorie_content.dart';
import 'package:kcalculus/ui/edibles/common/edible_search_results/widgets/edible_search_results_item_header.dart';
import 'package:kcalculus/ui/edibles/common/edible_stats.dart';

class EdibleSearchResultsItem extends StatelessWidget {
  const EdibleSearchResultsItem({
    super.key,
    required this.searchResult,
    required this.onSelectSearchResult,
  });

  final EdibleSearchResult searchResult;

  final void Function(EdibleSearchResult) onSelectSearchResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectSearchResult(searchResult);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EdibleSearchResultsItemHeader(
                        searchResult: searchResult,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        searchResult.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (searchResult.nutritionFactsPreview != null)
                  EdibleSearchResultsItemCalorieContent(
                    nutritionFactsPreview: searchResult.nutritionFactsPreview!,
                  ),
              ],
            ),
            if (searchResult.description.isNotEmpty)
              Text(
                searchResult.description,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            if (searchResult.nutritionFactsPreview != null)
              EdibleStats(
                nutritionFactsPreview: searchResult.nutritionFactsPreview!,
              ),
          ],
        ),
      ),
    );
  }
}
