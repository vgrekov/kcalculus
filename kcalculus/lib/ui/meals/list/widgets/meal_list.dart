import 'package:flutter/material.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/widgets/paged_list_vew.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_item.dart';
import 'package:kcalculus/utils/l10n.dart';

class MealList extends StatelessWidget with WidgetMessenger {
  const MealList({
    super.key,
    required this.items,
    this.itemsLoader,
    this.onRefresh,
    required this.onSelectMeal,
    required this.onDeleteMeal,
    this.readonly = false,
  });

  final List<Meal> items;

  final Future<dynamic>? itemsLoader;

  final Future<dynamic> Function()? onRefresh;

  final void Function(Meal) onSelectMeal;

  final void Function(Meal) onDeleteMeal;

  final bool readonly;

  @override
  Widget build(BuildContext context) {
    return PagedListView<Meal>(
      items: items,
      itemsLoader: itemsLoader,
      noItemsMessage: l10n(context).messageNoMeals,
      onDeleteItem: onDeleteMeal,
      confirmDeleteMessage: (_) =>
          l10n(context).messageMealDeletionConfirmation,
      onRefresh: onRefresh,
      itemBuilder: (context, item) => MealListItem(
        meal: item,
        onSelectMeal: onSelectMeal,
      ),
      verticalGap: 4,
    );
  }
}
