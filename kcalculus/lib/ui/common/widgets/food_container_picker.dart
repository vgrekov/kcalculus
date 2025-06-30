import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/ui/food_containers/search/widgets/food_container_search_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class FoodContainerPicker extends StatelessWidget {
  const FoodContainerPicker({
    super.key,
    this.container,
    this.onSelectContainer,
    this.onUnselectContainer,
  });

  final FoodContainer? container;

  final void Function(FoodContainer container)? onSelectContainer;

  final void Function()? onUnselectContainer;

  void _selectFoodContainer(BuildContext context) async {
    final container = await Navigator.of(context).push<FoodContainer>(
      MaterialPageRoute(
        builder: (context) => FoodContainerSearchScreen(),
      ),
    );

    if (container != null) {
      onSelectContainer?.call(container);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputChip(
      onPressed: () {
        _selectFoodContainer(context);
      },
      onDeleted: container == null ? null : onUnselectContainer,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      deleteIconColor: Theme.of(context).colorScheme.onSecondaryContainer,
      label: Text(
        container == null
            ? l10n(context).labelFoodContainerSelect
            : l10n(context).labelFoodContainerSelected(
                container!.name,
                nb.formatDouble(context, container!.weight.value),
                container!.weight.unit.localName(context),
              ),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
    );
  }
}
