import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/nutrients/search/widgets/nutrient_search_list_item.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientSearchList extends StatelessWidget {
  const NutrientSearchList({
    super.key,
    required this.items,
    this.onSelectItem,
  });

  final List<Nutrient> items;

  final void Function(Nutrient)? onSelectItem;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Center(
            child: Text(
              l10n(context).messageNutrientSearchNothingFound,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          )
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => NutrientSearchListItem(
              item: items[index],
              onSelectItem: onSelectItem,
            ),
          );
  }
}
