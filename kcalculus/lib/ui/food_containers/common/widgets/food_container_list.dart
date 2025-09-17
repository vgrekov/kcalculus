import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/ui/common/view_models/paginator.dart';
import 'package:kcalculus/ui/common/widgets/paged_list_vew.dart';
import 'package:kcalculus/ui/food_containers/common/widgets/food_container_list_item.dart';
import 'package:kcalculus/utils/l10n.dart';

class FoodContainerList extends StatelessWidget {
  const FoodContainerList({
    super.key,
    required this.items,
    this.itemsLoader,
    required this.onSelectItem,
    this.onDeleteItem,
    this.paginator,
  });

  final List<FoodContainer> items;

  final Future<dynamic>? itemsLoader;

  final void Function(FoodContainer) onSelectItem;

  final void Function(FoodContainer)? onDeleteItem;

  final Paginator<FoodContainer>? paginator;

  @override
  Widget build(BuildContext context) {
    return PagedListView<FoodContainer>(
      items: items,
      itemsLoader: itemsLoader,
      noItemsMessage: l10n(context).messageFoodContainerSearchNothingFound,
      onDeleteItem: onDeleteItem,
      confirmDeleteMessage: (_) =>
          l10n(context).messageFoodContainerDeletionConfirmation,
      onRefresh: paginator?.refresh,
      onLoadNextPage: paginator?.loadNextPage,
      itemBuilder: (context, item) => FoodContainerListItem(
        container: item,
        onSelectContainer: onSelectItem,
      ),
    );
  }
}
