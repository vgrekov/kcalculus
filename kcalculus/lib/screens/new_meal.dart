import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/daily_log.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/meal.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';

class NewMealScreen extends ConsumerStatefulWidget {
  const NewMealScreen({super.key});

  @override
  ConsumerState<NewMealScreen> createState() {
    return _NewMealScreenState();
  }
}

class _NewMealScreenState extends ConsumerState<NewMealScreen>
    with StateMessenger, ProgressiveState {
  String _name = '';
  Amount? _amount;

  final _form = GlobalKey<FormState>();
  final _nutritionFactsController = NutritionFactsInputController();

  @override
  void dispose() {
    _nutritionFactsController.dispose();
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

    final nutritionFacts = _nutritionFactsController.nutritionFacts!;
    final hasCommonMeasure = nutritionFacts
        .any((nf) => nf.amount.unit.measure == _amount!.unit.measure);
    if (!hasCommonMeasure) {
      showMessage(
        '''You specified the meal amount in ${_amount!.unit.displayName} of measure ${_amount!.unit.measure!.displayName}.
In at least one 'per' field of the nutrition facts, the amount should be specified in units of ${_amount!.unit.measure!.displayName}.''',
        MessageType.error,
      );
      return;
    }

    showProgress();

    try {
      await ref.read(dailyLogProvider.notifier).addMeal(
            Meal(
              edible: Food(
                name: _name,
                nutritionFacts: nutritionFacts,
              ),
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

  String? _validateMealName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Meal',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        actions: [
          TextButton(onPressed: _saveMeal, child: const Text('Save')),
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
                TextFormField(
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
                    labelText: 'Name',
                    isDense: true,
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  maxLength: 50,
                  validator: _validateMealName,
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 8),
                AmountInput(
                  label: 'Amount',
                  initialUnit: Unit.gram,
                  onSaveAmount: (amount) {
                    _amount = amount;
                  },
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
