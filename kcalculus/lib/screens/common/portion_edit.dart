import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/edible_name_input.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';
import 'package:kcalculus/widgets/text_input.dart';

class EditPortionScreen extends ConsumerStatefulWidget {
  final String title;
  final Portion portion;
  final FutureOr<void> Function(Amount) onSavePortion;

  const EditPortionScreen({
    super.key,
    required this.title,
    required this.portion,
    required this.onSavePortion,
  });

  @override
  ConsumerState<EditPortionScreen> createState() {
    return _EditPortionScreenState();
  }
}

class _EditPortionScreenState extends ConsumerState<EditPortionScreen>
    with StateMessenger, ProgressiveState {
  late Amount _amount;

  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nutritionFactsController = NutritionFactsInputController();

  @override
  void initState() {
    _amount = widget.portion.amount;
    _nameController.text = widget.portion.edible.name;
    _descriptionController.text = widget.portion.edible.description;
    _nutritionFactsController.nutritionFacts =
        widget.portion.edible.getNutritionFacts();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _nutritionFactsController.dispose();
    super.dispose();
  }

  void _savePortion() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState!.save();

    if (!_checkIfCommonMeasureExists()) {
      return;
    }

    showProgress();

    try {
      await widget.onSavePortion(_amount);

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
          widget.title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        actions: [
          TextButton(
            onPressed: _savePortion,
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
              EdibleNameInput(
                controller: _nameController,
                enabled: false,
              ),
              const SizedBox(height: 8),
              TextInput(
                controller: _descriptionController,
                labelText: l10n(context).labelEdibleDescription,
                hintText: l10n(context).hintEdibleDescription,
                maxLength: 100,
                maxLines: 2,
                textCapitalization: TextCapitalization.words,
                enabled: false,
              ),
              const SizedBox(height: 8),
              Form(
                key: _form,
                child: AmountInput(
                  label: l10n(context).labelPortionAmount,
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
