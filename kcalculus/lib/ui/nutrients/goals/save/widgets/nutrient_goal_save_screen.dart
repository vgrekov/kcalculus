import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientGoalSaveScreen extends StatefulWidget {
  const NutrientGoalSaveScreen.add({
    super.key,
    required this.nutrient,
  }) : goal = null;

  NutrientGoalSaveScreen.edit({
    super.key,
    required this.goal,
  }) : nutrient = goal!.nutrient;

  final Nutrient nutrient;

  final NutrientGoal? goal;

  @override
  State<StatefulWidget> createState() {
    return _NutrientGoalSaveScreenState();
  }
}

class _NutrientGoalSaveScreenState extends State<NutrientGoalSaveScreen> {
  final _form = GlobalKey<FormState>();

  final _amountController = AmountInputController();

  @override
  void initState() {
    if (widget.goal != null) {
      _amountController.setAmount(widget.goal!.amount);
    } else {
      _amountController.setUnit(widget.nutrient.defaultUnit);
    }

    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();

    super.dispose();
  }

  void _saveGoal() {
    if (!_form.currentState!.validate()) return;

    _form.currentState!.save();

    final amount = Amount(
      unit: _amountController.unit!,
      value: _amountController.value!,
    );

    final goal = widget.goal != null
        ? widget.goal!.copyWith(amount: amount)
        : NutrientGoal(
            nutrient: widget.nutrient,
            amount: amount,
          );

    Navigator.of(context).pop(goal);
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
            widget.goal?.id != null
                ? l10n(context).screenEditNutrientGoal
                : l10n(context).screenAddNutrientGoal,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          actions: [
            TextButton(
              onPressed: _saveGoal,
              child: Text(
                l10n(context).actionSave,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AmountInput(
                      key: ValueKey(widget.nutrient),
                      controller: _amountController,
                      label: widget.nutrient.localName(l10n(context)),
                      fixedMeasure: widget.nutrient.defaultUnit.measure,
                      required: true,
                      allowZero: false,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
