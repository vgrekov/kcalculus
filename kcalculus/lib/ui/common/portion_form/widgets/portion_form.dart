import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/edible/models/portion.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/widgets/nutrition_facts_input.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/modified_edible_option.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/portion_form_ui_state.dart';
import 'package:kcalculus/ui/common/portion_form/view_models/portion_form_view_model.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/ui/common/widgets/edible_name_input.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/edibles/search/widgets/edible_search_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class PortionForm extends ConsumerStatefulWidget {
  const PortionForm({
    super.key,
    required this.controller,
    required this.nutrientDefaults,
  });

  final PortionFormController controller;

  final List<Nutrient> nutrientDefaults;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PortionFormState();
  }
}

class _PortionFormState extends ConsumerState<PortionForm> with StateMessenger {
  Portion? _portion;

  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _amountController = AmountInputController();

  final _nutritionFactsController = NutritionFactsInputController();

  late FocusNode _nameFocusNode;

  late FocusNode _descriptionFocusNode;

  late FocusNode _amountFocusNode;

  late FocusNode _nutritionFactsFocusNode;

  late final _assignments = <PortionFormCommand, UiAssignment>{
    PortionFormCommand.showNoCommonMeasureMessage: _showNoCommonMeasureMessage,
    PortionFormCommand.showEdibleAlreadyExistsDialog:
        _showEdibleAlreadyExistsDialog,
    PortionFormCommand.showSelectedEdibleModifiedAlreadyExistsDialog:
        _showSelectedEdibleModifiedAlreadyExistsDialog,
    PortionFormCommand.showSelectedEdibleModifiedCreatesNewDialog:
        _showSelectedEdibleModifiedCreatesNewDialog,
    PortionFormCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _amountFocusNode = FocusNode();
    _nutritionFactsFocusNode = FocusNode();

    _loadPortion(widget.controller.getPortion());

    widget.controller.addListener(_onControllerCommand);

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerCommand);

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

  void _loadPortion(FutureOr<Portion?> portion) async {
    _portion = await portion;

    final uiState = ref.read(portionFormViewModel(_portion));

    _loadUiState(uiState);

    // Force build
    setState(() {});

    if (_portion != null) {
      _amountFocusNode.requestFocus();
    }
  }

  void _loadUiState(PortionFormUiState uiState) {
    _nameController.text = uiState.name;
    _descriptionController.text = uiState.description;
    _amountController.setUnit(uiState.amountUnit);
    _amountController.setValue(uiState.amountValue);
    _nutritionFactsController.load(uiState.nutritionFacts);
  }

  bool _validate() {
    return _form.currentState!.validate() &&
        _nutritionFactsController.validate();
  }

  void _saveUiState() {
    _form.currentState!.save();

    final viewModel = ref.read(portionFormViewModel(_portion).notifier);

    viewModel.updateState(
      (state) => state.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        amountUnit: _amountController.unit,
        amountValue: _amountController.value,
        nutritionFacts: _nutritionFactsController.save(),
      ),
    );
  }

  void _searchEdibles() async {
    String query = _nameController.text;
    final edible = await Navigator.of(context).push<Edible>(
      MaterialPageRoute(
        builder: (context) => EdibleSearchScreen(
          initialQuery: query,
        ),
      ),
    );

    if (edible != null) {
      _selectEdible(edible);
    }
  }

  void _selectEdible(Edible edible) {
    _form.currentState!.save();

    final viewModel = ref.read(portionFormViewModel(_portion).notifier);

    viewModel.selectEdible(
      edible,
      _amountController.unit,
      _amountController.value,
    );

    _amountFocusNode.requestFocus();
  }

  void _onControllerCommand() async {
    if (widget.controller._command != null) {
      switch (widget.controller._command!) {
        case _PortionFormControllerCommand.load:
          _loadPortion(widget.controller.getPortion());
          break;
        case _PortionFormControllerCommand.validate:
          widget.controller._isValid = _validate();
          break;
        case _PortionFormControllerCommand.save:
          _saveUiState();
          widget.controller._portion =
              ref.read(portionFormViewModel(_portion).notifier).buildPortion();
          break;
      }
    }
  }

  void _showNoCommonMeasureMessage(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final uiState = ref.read(portionFormViewModel(_portion));
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

  void _showEdibleAlreadyExistsDialog(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
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

  void _showSelectedEdibleModifiedAlreadyExistsDialog(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
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

  void _showSelectedEdibleModifiedCreatesNewDialog(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
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

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(portionFormViewModel(_portion), (prev, next) {
      _loadUiState(next);
    });

    return UiSubordinate<PortionFormCommand>(
      commandProvider:
          ref.read(portionFormViewModel(_portion).notifier).commandProvider,
      assignments: _assignments,
      child: Form(
        key: _form,
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
              defaultNutrients: widget.nutrientDefaults,
              controller: _nutritionFactsController,
              focusNode: _nutritionFactsFocusNode,
            ),
          ],
        ),
      ),
    );
  }
}

enum _PortionFormControllerCommand {
  load,
  validate,
  save,
}

class PortionFormController extends ChangeNotifier {
  PortionFormController({
    Portion? portion,
  }) : _portion = Future.value(portion);

  Future<Portion?>? _portion;

  bool _isValid = false;

  _PortionFormControllerCommand? _command;

  bool get isValid => _isValid;

  FutureOr<Portion?> getPortion() => _portion;

  void setPortion(Portion? value) {
    _portion = Future.value(value);
    _command = _PortionFormControllerCommand.load;
    notifyListeners();
  }

  void validate() {
    _command = _PortionFormControllerCommand.validate;
    notifyListeners();
  }

  void save() {
    _command = _PortionFormControllerCommand.save;
    notifyListeners();
  }
}
