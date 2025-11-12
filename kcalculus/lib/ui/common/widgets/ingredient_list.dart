import 'package:flutter/material.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/common/widgets/ingredient_list_item.dart';

class IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;
  final void Function(Ingredient ingredient, int index)? onSelectIngredient;
  final void Function(Ingredient ingredient, int index)? onDeleteIngredient;

  const IngredientList({
    super.key,
    required this.ingredients,
    this.onSelectIngredient,
    this.onDeleteIngredient,
  });

  @override
  Widget build(BuildContext context) {
    final listStyle = Theme.of(context).extension<ListStyle>();

    return ListView.separated(
      itemCount: ingredients.length,
      padding: EdgeInsets.symmetric(vertical: listStyle?.verticalGap ?? 0),
      separatorBuilder: (_, __) => (listStyle?.verticalGap ?? 0) > 0
          ? SizedBox(height: listStyle!.verticalGap)
          : const SizedBox.shrink(),
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];

        return IngredientListItem(
          ingredient: ingredient,
          onSelectIngredient: onSelectIngredient == null
              ? null
              : (ingredient) {
                  onSelectIngredient!(ingredient, index);
                },
          onDeleteIngredient: onDeleteIngredient == null
              ? null
              : (ingredient) {
                  onDeleteIngredient!(ingredient, index);
                },
        );
      },
    );
  }
}
