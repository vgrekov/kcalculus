import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_vew.dart';
import 'package:kcalculus/ui/food_containers/common/widgets/food_container_list_item.dart';
import 'package:kcalculus/utils/l10n.dart';

class FoodContainerList extends StatelessWidget {
  const FoodContainerList({
    super.key,
    required this.items,
    this.onLoadNextPage,
    this.onRefresh,
    required this.onSelectItem,
    this.onDeleteItem,
  });

  final FutureOr<List<FoodContainer>> items;

  final Future<List<FoodContainer>> Function()? onLoadNextPage;

  final Future<List<FoodContainer>> Function()? onRefresh;

  final void Function(FoodContainer) onSelectItem;

  final void Function(FoodContainer)? onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return PagedListView<FoodContainer>(
      items: items,
      onLoadNextPage: onLoadNextPage,
      onRefresh: onRefresh,
      noItemsMessage: l10n(context).messageFoodContainerSearchNothingFound,
      onDeleteItem: onDeleteItem,
      deletableTest: (item) => item.deletedAt == null,
      confirmDeleteMessage: (_) =>
          l10n(context).messageFoodContainerDeletionConfirmation,
      itemBuilder: (context, item) => FoodContainerListItem(
        container: item,
        onSelectContainer: item.deletedAt == null ? onSelectItem : (_) {},
      ),
    );
  }
}
