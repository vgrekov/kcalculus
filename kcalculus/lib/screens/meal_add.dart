import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/daily_log.dart';
import 'package:kcalculus/data/edible_search.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/screens/edible_search.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/meal_name_input.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';

class AddMealScreen extends ConsumerStatefulWidget {
  const AddMealScreen({super.key});

  @override
  ConsumerState<AddMealScreen> createState() {
    return _AddMealScreenState();
  }
}

class _AddMealScreenState extends ConsumerState<AddMealScreen>
    with StateMessenger, ProgressiveState {
  Edible? _selectedEdible;

  String _name = '';
  String _description = '';
  Amount? _amount;

  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nutritionFactsController = NutritionFactsInputController();

  late FocusNode _amountFocusNode;

  @override
  void initState() {
    _amountFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _nutritionFactsController.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }

  void _saveMeal() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _nutritionFactsController.validate();
    if (!_nutritionFactsController.isValid) {
      return;
    }

    _form.currentState!.save();
    _nutritionFactsController.save();

    if (!_checkIfCommonMeasureExists()) {
      return;
    }

    final edible = await getEdible();
    if (edible == null) {
      return;
    }

    showProgress();

    try {
      await ref.read(dailyLogProvider.notifier).addMeal(
            Meal(
              edible: edible,
              amount: _amount!,
              eatenAt: DateTime.now(),
            ),
          );
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      showNotification(error.toString());
    }

    hideProgress();
  }

  void _searchEdibles() {
    String query = _nameController.text;
    ref.read(edibleSearchQueryProvider.notifier).setQuery(query);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EdibleSearchScreen(
          onSelectEdible: _selectEdible,
        ),
      ),
    );
  }

  void _selectEdible(Edible edible) {
    _selectedEdible = edible;
    _nameController.text = edible.name;
    _descriptionController.text = edible.description ?? '';
    _nutritionFactsController.nutritionFacts = edible.getNutritionFacts();
    _amountFocusNode.requestFocus();
  }

  bool _checkIfCommonMeasureExists() {
    final nutritionFacts = _nutritionFactsController.nutritionFacts!;
    final hasCommonMeasure = nutritionFacts
        .any((nf) => nf.amount.unit.measure == _amount!.unit.measure);
    if (!hasCommonMeasure) {
      showMessage(
        l10n(context).messageNoCommonMeasureError(
          _amount!.unit.localName(context),
          _amount!.unit.measure!.localName(context),
        ),
        MessageType.error,
      );
      return false;
    }

    return true;
  }

  bool _isSelectedEdibleModified() {
    if (_selectedEdible != null) {
      if (_selectedEdible!.name != _name ||
          (_selectedEdible!.description ?? '') != _description) {
        return true;
      }

      final nutritionFactsEntered =
          _nutritionFactsController.nutritionFacts!.toSet();
      final nutritionFactsSelected =
          _selectedEdible!.getNutritionFacts().toSet();
      if (!setEquals(nutritionFactsEntered, nutritionFactsSelected)) {
        return true;
      }
    }

    return false;
  }

  FutureOr<Edible?> getEdible() async {
    if (_selectedEdible != null) {
      if (!_isSelectedEdibleModified()) {
        return _selectedEdible;
      } else {
        final confirmed = await showConfirmation(
              l10n(context).messageNewEdibleConfirmation,
            ) ??
            false;
        if (!confirmed) {
          return null;
        }
      }
    }

    return Food(
      name: _name,
      description: _description,
      nutritionFacts: _nutritionFactsController.nutritionFacts!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n(context).screenNewMeal,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        actions: [
          TextButton(
            onPressed: _saveMeal,
            child: Text(l10n(context).actionSave),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'search-box',
                  child: Material(
                    type: MaterialType.transparency,
                    child: MealNameInput(
                      controller: _nameController,
                      autofocus: true,
                      onSearchPressed: _searchEdibles,
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: l10n(context).labelEdibleDescription,
                    hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: l10n(context).hintEdibleDescription,
                    isDense: true,
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  maxLength: 100,
                  maxLines: 2,
                  textCapitalization: TextCapitalization.words,
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                const SizedBox(height: 8),
                AmountInput(
                  label: l10n(context).labelMealAmount,
                  initialUnit: Unit.gram,
                  focusNode: _amountFocusNode,
                  onSaveAmount: (amount) {
                    _amount = amount;
                  },
                  allowZero: false,
                ),
                const SizedBox(height: 32),
                NutritionFactsInput(
                  controller: _nutritionFactsController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
