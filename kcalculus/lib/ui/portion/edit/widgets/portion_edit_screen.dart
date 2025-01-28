import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/portion/edit/view_models/portion_edit_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/edible_name_input.dart';
import 'package:kcalculus/widgets/inattentive.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';
import 'package:kcalculus/widgets/text_input.dart';

class PortionEditScreen extends ConsumerStatefulWidget {
  /// This screen will handle [onSavePortion]'s error handling
  const PortionEditScreen({
    super.key,
    required this.title,
    required this.onSavePortion,
  });

  final String title;

  final FutureOr<void> Function(Amount) onSavePortion;

  @override
  ConsumerState<PortionEditScreen> createState() {
    return _PortionEditScreenState();
  }
}

class _PortionEditScreenState extends ConsumerState<PortionEditScreen>
    with StateMessenger, ProgressiveState {
  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _amountController = AmountInputController();

  final _nutritionFactsController = NutritionFactsInputController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _nutritionFactsController.dispose();
    super.dispose();
  }

  void _savePortion() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState!.save();

    final viewModel = ref.read(portionEditViewModel.notifier);

    viewModel.updateState(
      amountUnit: _amountController.unit,
      amountValue: _amountController.value,
    );

    await viewModel.savePortion(widget.onSavePortion);
  }

  void _onUiCommand(
    AsyncValue<UiCommand>? prev,
    AsyncValue<UiCommand> next,
  ) {
    if (next is AsyncData) {
      final command = next.value!;
      if (command.type is PortionEditCommand) {
        switch (command.type as PortionEditCommand) {
          case PortionEditCommand.showNoCommonMeasureMessage:
            _showNoCommonMeasureMessage(command);
            break;
          case PortionEditCommand.showUnknownErrorNotification:
            showNotification(l10n(context).messageUnknownError);
            command.complete();
            break;
          case PortionEditCommand.exit:
            _exit(command);
            break;
        }
      }
    }
  }

  void _showNoCommonMeasureMessage(UiCommand command) {
    final uiState = ref.read(portionEditViewModel);
    final amount = uiState.getAmount()!;
    showMessage(
      l10n(context).messageNoCommonMeasureError(
        amount.unit.localName(context),
        amount.unit.measure.localName(context),
      ),
      MessageType.error,
    );
    command.complete();
  }

  void _exit([UiCommand? command]) {
    Navigator.of(context).pop();
    command?.complete();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(portionEditViewModel);

    if (uiState.edible != null) {
      _nameController.text = uiState.edible!.name;
      _descriptionController.text = uiState.edible!.description;
      _nutritionFactsController.nutritionFacts =
          uiState.edible!.getNutritionFacts();
    }

    ref.listen(
      ref.read(portionEditViewModel.notifier).commandProvider,
      _onUiCommand,
    );

    return Inattentive(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: _exit,
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
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
                  textCapitalization: TextCapitalization.sentences,
                  enabled: false,
                ),
                const SizedBox(height: 8),
                Form(
                  key: _form,
                  child: AmountInput(
                    label: l10n(context).labelPortionAmount,
                    initialUnit: uiState.amountUnit,
                    initialValue: uiState.amountValue,
                    controller: _amountController,
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
      ),
    );
  }
}
