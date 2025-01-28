import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/edibles.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/edibles/search/widgets/edible_search_screen.dart';
import 'package:kcalculus/ui/portions/add/view_models/portion_add_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/edible_name_input.dart';
import 'package:kcalculus/widgets/inattentive.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';
import 'package:kcalculus/widgets/text_input.dart';

class PortionAddScreen extends ConsumerStatefulWidget {
  /// This screen will handle [onSavePortion]'s error handling
  const PortionAddScreen({
    super.key,
    required this.title,
    required this.onSavePortion,
    this.edibleSearchFilter,
  });

  final String title;

  final FutureOr<void> Function(Edible, Amount) onSavePortion;

  final bool Function(EdibleSearchResult)? edibleSearchFilter;

  @override
  ConsumerState<PortionAddScreen> createState() {
    return _PortionAddScreenState();
  }
}

class _PortionAddScreenState extends ConsumerState<PortionAddScreen>
    with StateMessenger, ProgressiveState {
  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _amountController = AmountInputController();

  final _nutritionFactsController = NutritionFactsInputController();

  late FocusNode _nameFocusNode;

  late FocusNode _descriptionFocusNode;

  late FocusNode _amountFocusNode;

  late FocusNode _nutritionFactsFocusNode;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _amountFocusNode = FocusNode();
    _nutritionFactsFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _nutritionFactsController.dispose();

    _nutritionFactsFocusNode.dispose();
    _amountFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  void _savePortion() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _nutritionFactsController.validate();
    if (!_nutritionFactsController.isValid) {
      return;
    }

    _form.currentState!.save();
    _nutritionFactsController.save();

    final viewModel = ref.read(portionAddViewModel.notifier);

    viewModel.updateState(
      name: _nameController.text,
      description: _descriptionController.text,
      amountUnit: _amountController.unit,
      amountValue: _amountController.value,
      nutritionFacts: _nutritionFactsController.nutritionFacts,
    );

    await viewModel.savePortion(widget.onSavePortion);
  }

  void _searchEdibles() {
    String query = _nameController.text;
    ref.read(edibleSearchQueryProvider.notifier).setQuery(query);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EdibleSearchScreen(
          onSelectEdible: _selectEdible,
          edibleSearchFilter: widget.edibleSearchFilter,
        ),
      ),
    );
  }

  void _selectEdible(Edible edible) {
    ref.read(portionAddViewModel.notifier).selectEdible(edible);
    _amountFocusNode.requestFocus();
  }

  void _onUiCommand(
    AsyncValue<UiCommand>? prev,
    AsyncValue<UiCommand> next,
  ) {
    if (next is AsyncData) {
      final command = next.value!;
      if (command.type is PortionAddCommand) {
        switch (command.type as PortionAddCommand) {
          case PortionAddCommand.showNoCommonMeasureMessage:
            _showNoCommonMeasureMessage(command);
            break;
          case PortionAddCommand.showEdibleAlreadyExistsDialog:
            _showEdibleAlreadyExistsDialog(command);
            break;
          case PortionAddCommand.showSelectedEdibleModifiedAlreadyExistsDialog:
            _showSelectedEdibleModifiedAlreadyExistsDialog(command);
            break;
          case PortionAddCommand.showSelectedEdibleModifiedCreatesNewDialog:
            _showSelectedEdibleModifiedCreatesNewDialog(command);
            break;
          case PortionAddCommand.showUnknownErrorNotification:
            showNotification(l10n(context).messageUnknownError);
            command.complete();
            break;
          case PortionAddCommand.exit:
            _exit(command);
            break;
        }
      }
    }
  }

  void _showNoCommonMeasureMessage(UiCommand command) {
    final uiState = ref.read(portionAddViewModel);
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

  void _showEdibleAlreadyExistsDialog(UiCommand command) {
    showMessageDialog<void>(
      message: l10n(context).messageEdibleAlreadyExists,
      actions: {
        l10n(context).actionOk: () {
          _nameFocusNode.requestFocus();
        },
      },
      messageType: MessageType.error,
    );
    command.complete();
  }

  void _showSelectedEdibleModifiedAlreadyExistsDialog(UiCommand command) {
    showMessageDialog<void>(
      message: l10n(context).messageSelectedEdibleModifiedAlreadyExists,
      actions: {
        l10n(context).actionOk: () {
          _nameFocusNode.requestFocus();
        },
      },
      messageType: MessageType.error,
    );
    command.complete();
  }

  void _showSelectedEdibleModifiedCreatesNewDialog(UiCommand command) {
    command.complete(
      showMessageDialog<ModifiedEdibleOption>(
        message: l10n(context).messageSelectedEdibleModifiedCreatesNew,
        actions: {
          l10n(context).actionCancel: () => null,
          l10n(context).actionUseSelectedEdible: () =>
              ModifiedEdibleOption.useSelected,
          l10n(context).actionCreateNewEdible: () =>
              ModifiedEdibleOption.createNew,
        },
        messageType: MessageType.confirm,
      ),
    );
  }

  void _exit([UiCommand? command]) {
    Navigator.of(context).pop();
    command?.complete();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(portionAddViewModel);

    _nameController.text = uiState.name;
    _descriptionController.text = uiState.description;
    _nutritionFactsController.nutritionFacts = uiState.nutritionFacts;

    ref.listen(
      ref.read(portionAddViewModel.notifier).commandProvider,
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
                      child: EdibleNameInput(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          _descriptionFocusNode.requestFocus();
                        },
                        onSearchPressed: _searchEdibles,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextInput(
                    controller: _descriptionController,
                    focusNode: _descriptionFocusNode,
                    labelText: l10n(context).labelEdibleDescription,
                    hintText: l10n(context).hintEdibleDescription,
                    maxLength: 100,
                    maxLines: 2,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      _amountFocusNode.requestFocus();
                    },
                  ),
                  const SizedBox(height: 8),
                  AmountInput(
                    label: l10n(context).labelPortionAmount,
                    initialUnit: uiState.amountUnit,
                    initialValue: uiState.amountValue,
                    controller: _amountController,
                    focusNode: _amountFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      _nutritionFactsFocusNode.requestFocus();
                    },
                    allowZero: false,
                  ),
                  const SizedBox(height: 32),
                  NutritionFactsInput(
                    controller: _nutritionFactsController,
                    focusNode: _nutritionFactsFocusNode,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
