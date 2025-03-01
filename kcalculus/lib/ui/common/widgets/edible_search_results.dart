import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/paginator.dart';
import 'package:kcalculus/ui/common/widgets/edible_search_results_item.dart';
import 'package:kcalculus/ui/common/widgets/paged_list_vew.dart';

class EdibleSearchResults extends StatelessWidget {
  const EdibleSearchResults({
    super.key,
    required this.items,
    this.itemsLoader,
    required this.onSelectItem,
    this.noItemsMessage,
    this.confirmDeleteMessage,
    this.onDeleteItem,
    this.paginator,
  });

  final List<EdibleSearchResult> items;

  final Future<dynamic>? itemsLoader;

  final void Function(EdibleSearchResult) onSelectItem;

  final String? noItemsMessage;

  final String? confirmDeleteMessage;

  final void Function(EdibleSearchResult)? onDeleteItem;

  final Paginator<EdibleSearchResult>? paginator;

  @override
  Widget build(BuildContext context) {
    return PagedListView<EdibleSearchResult>(
      items: items,
      itemsLoader: itemsLoader,
      noItemsMessage: noItemsMessage,
      onDeleteItem: onDeleteItem,
      confirmDeleteMessage: confirmDeleteMessage,
      onRefresh: paginator?.refresh,
      onLoadNextPage: paginator?.loadNextPage,
      itemBuilder: (context, item) => EdibleSearchResultsItem(
        searchResult: item,
        onSelectSearchResult: onSelectItem,
      ),
    );
  }
}
