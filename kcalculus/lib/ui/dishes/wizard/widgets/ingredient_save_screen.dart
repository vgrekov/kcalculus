import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/ui/common/portion_form/widgets/portion_form.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/utils/l10n.dart';

class IngredientSaveScreen extends StatefulWidget {
  const IngredientSaveScreen({
    super.key,
    this.ingredient,
    required this.onSaveIngredient,
  });

  final Ingredient? ingredient;

  final void Function(Ingredient) onSaveIngredient;

  @override
  State<StatefulWidget> createState() {
    return _IngredientSaveScreenState();
  }
}

class _IngredientSaveScreenState extends State<IngredientSaveScreen> {
  final _portionFormController = PortionFormController();

  @override
  void initState() {
    _portionFormController.setPortion(widget.ingredient);

    super.initState();
  }

  @override
  void dispose() {
    _portionFormController.dispose();

    super.dispose();
  }

  void _saveIngredient() async {
    _portionFormController.validate();
    if (!_portionFormController.isValid) {
      return;
    }

    _portionFormController.save();

    final portion = await _portionFormController.getPortion();
    if (portion != null) {
      widget.onSaveIngredient(
        Ingredient(
          edible: portion.edible,
          amount: portion.amount,
        ),
      );

      _exit();
    }
  }

  void _exit() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Inattentive(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: _exit,
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.ingredient == null
                ? l10n(context).screenAddIngredient
                : l10n(context).screenEditIngredient,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          actions: [
            TextButton(
              onPressed: _saveIngredient,
              child: Text(
                l10n(context).actionSave,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PortionForm(
              controller: _portionFormController,
            ),
          ),
        ),
      ),
    );
  }
}
