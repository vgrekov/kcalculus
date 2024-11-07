import 'package:flutter/material.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/widgets/edible_search_results_item.dart';

class EdibleSearchResults extends StatelessWidget {
  final List<EdibleSearchResult> searchResults;
  final void Function(EdibleSearchResult) onSelectSearchResult;

  const EdibleSearchResults({
    super.key,
    required this.searchResults,
    required this.onSelectSearchResult,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final searchResult = searchResults[index];
        return EdibleSearchResultsItem(
          searchResult: searchResult,
          onSelectSearchResult: onSelectSearchResult,
        );
      },
    );
  }
}
