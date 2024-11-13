import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/daily_log.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/meal_name_input.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';

class EditMealScreen extends ConsumerStatefulWidget {
  final Meal meal;

  const EditMealScreen({
    super.key,
    required this.meal,
  });

  @override
  ConsumerState<EditMealScreen> createState() {
    return _EditMealScreenState();
  }
}

class _EditMealScreenState extends ConsumerState<EditMealScreen>
    with StateMessenger, ProgressiveState {
  late Amount _amount;

  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nutritionFactsController = NutritionFactsInputController();

  @override
  void initState() {
    _amount = widget.meal.amount;
    _nameController.text = widget.meal.edible.name;
    _descriptionController.text = widget.meal.edible.description;
    _nutritionFactsController.nutritionFacts =
        widget.meal.edible.getNutritionFacts();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _nutritionFactsController.dispose();
    super.dispose();
  }

  void _saveMeal() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState!.save();

    if (!_checkIfCommonMeasureExists()) {
      return;
    }

    showProgress();

    try {
      await ref.read(dailyLogProvider.notifier).updateMeal(
            widget.meal.copyWith(
              amount: _amount,
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

  bool _checkIfCommonMeasureExists() {
    final nutritionFacts = _nutritionFactsController.nutritionFacts!;
    final hasCommonMeasure = nutritionFacts
        .any((nf) => nf.amount.unit.measure == _amount.unit.measure);
    if (!hasCommonMeasure) {
      showMessage(
        l10n(context).messageNoCommonMeasureError(
          _amount.unit.localName(context),
          _amount.unit.measure!.localName(context),
        ),
        MessageType.error,
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n(context).screenEditMeal,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MealNameInput(
                controller: _nameController,
                enabled: false,
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
                enabled: false,
              ),
              const SizedBox(height: 8),
              Form(
                key: _form,
                child: AmountInput(
                  label: l10n(context).labelMealAmount,
                  initialValue: _amount.value,
                  initialUnit: _amount.unit,
                  onSaveAmount: (amount) {
                    _amount = amount!;
                  },
                  allowZero: false,
                  autofocus: true,
                ),
              ),
              const SizedBox(height: 32),
              NutritionFactsInput(
                controller: _nutritionFactsController,
                enabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
