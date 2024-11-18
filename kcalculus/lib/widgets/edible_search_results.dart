import 'package:flutter/material.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/widgets/edible_search_results_item.dart';

class EdibleSearchResults extends StatelessWidget with Messenger {
  final List<EdibleSearchResult> searchResults;
  final void Function(EdibleSearchResult) onSelectSearchResult;
  final void Function(EdibleSearchResult)? onDeleteEdible;

  const EdibleSearchResults({
    super.key,
    required this.searchResults,
    required this.onSelectSearchResult,
    this.onDeleteEdible,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final searchResult = searchResults[index];
        final searchResultItem = EdibleSearchResultsItem(
          searchResult: searchResult,
          onSelectSearchResult: onSelectSearchResult,
        );
        return onDeleteEdible == null
            ? searchResultItem
            : Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  return await showConfirmation(
                        context,
                        l10n(context).messageFoodDeletionConfirmation,
                      ) ??
                      false;
                },
                onDismissed: (direction) {
                  onDeleteEdible!(searchResult);
                },
                background: Container(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.delete,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ),
                child: searchResultItem,
              );
      },
    );
  }
}
