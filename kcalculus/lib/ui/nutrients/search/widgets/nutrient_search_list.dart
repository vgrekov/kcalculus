import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/paged_list_view/widgets/paged_list_vew.dart';
import 'package:kcalculus/ui/nutrients/search/widgets/nutrient_search_list_item.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientSearchList extends StatelessWidget {
  const NutrientSearchList({
    super.key,
    required this.items,
    this.onSelectItem,
  });

  final FutureOr<List<Nutrient>> items;

  final void Function(Nutrient)? onSelectItem;

  @override
  Widget build(BuildContext context) {
    return PagedListView<Nutrient>(
      items: items,
      noItemsMessage: l10n(context).messageNutrientSearchNothingFound,
      itemBuilder: (context, item) => NutrientSearchListItem(
        item: item,
        onSelectItem: onSelectItem,
      ),
    );
  }
}
