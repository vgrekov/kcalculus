import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/ui/common/widgets/ingredient_list_item.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';

class IngredientList extends StatelessWidget with Messenger {
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
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];

        final ingredientListItem = IngredientListItem(
          ingredient: ingredient,
          onSelectIngredient: onSelectIngredient == null
              ? null
              : (ingredient) {
                  onSelectIngredient!(ingredient, index);
                },
        );

        return onDeleteIngredient == null
            ? ingredientListItem
            : Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  return await showConfirmation(
                        context,
                        l10n(context).messageIngredientDeletionConfirmation,
                      ) ??
                      false;
                },
                onDismissed: (direction) {
                  onDeleteIngredient!(ingredient, index);
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
                child: ingredientListItem,
              );
      },
    );
  }
}
