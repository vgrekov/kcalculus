import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/ui/common/widgets/nutrition_facts_input/nutrition_facts_ui_state.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutritionFactsInput extends StatefulWidget {
  const NutritionFactsInput({
    super.key,
    required this.controller,
    this.focusNode,
    this.enabled = true,
    this.onUserInteractionChange,
  });

  final NutritionFactsInputController controller;

  final FocusNode? focusNode;

  final bool enabled;

  final void Function()? onUserInteractionChange;

  @override
  State<StatefulWidget> createState() {
    return _NutritionFactsInputState();
  }
}

class _NutritionFactsInputState extends State<NutritionFactsInput>
    with StateMessenger {
  late List<NutritionFactsUiState> _nutritionFactsUiStates;

  int _recordIndex = 0;

  final _form = GlobalKey<FormState>();

  final _perAmountController = AmountInputController();

  final _caloriesAmountController = AmountInputController();

  final _fatAmountController = AmountInputController();

  final _carbsAmountController = AmountInputController();

  final _fiberAmountController = AmountInputController();

  final _proteinAmountController = AmountInputController();

  late FocusNode _perAmountFocusNode;

  late FocusNode _caloriesFocusNode;

  @override
  void initState() {
    _loadUiState(rebuild: false);

    widget.controller.addListener(_onControllerCommand);

    _perAmountFocusNode = widget.focusNode ?? FocusNode();
    _caloriesFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerCommand);

    _perAmountController.dispose();
    _caloriesAmountController.dispose();
    _fatAmountController.dispose();
    _carbsAmountController.dispose();
    _fiberAmountController.dispose();
    _proteinAmountController.dispose();

    if (widget.focusNode == null) {
      _perAmountFocusNode.dispose();
    }
    _caloriesFocusNode.dispose();

    super.dispose();
  }

  void _onControllerCommand() {
    if (widget.controller._command != null) {
      switch (widget.controller._command!) {
        case _NutritionFactsInputControllerCommand.load:
          _loadUiState();
          break;
        case _NutritionFactsInputControllerCommand.validate:
          widget.controller._isValid = _validate();
          break;
        case _NutritionFactsInputControllerCommand.save:
          _saveRecordUiState();
          widget.controller._nutritionFacts = _nutritionFactsUiStates
              .map(
                (d) => d.toModel(),
              )
              .toList();
          break;
      }
    }
  }

  void _loadUiState({bool rebuild = true}) {
    if (widget.controller.nutritionFacts?.isNotEmpty ?? false) {
      _nutritionFactsUiStates = widget.controller.nutritionFacts!
          .map(NutritionFactsUiState.fromModel)
          .toList();
    } else {
      _nutritionFactsUiStates = [
        NutritionFactsUiState(),
      ];
    }

    _loadRecordUiState(0);
    _recordIndex = 0;

    if (rebuild) {
      setState(() {});
    }
  }

  bool _validate() {
    _saveRecordUiState();
    return _form.currentState!.validate();
  }

  void _addRecord() {
    if (_validate()) {
      final currentUiState = _nutritionFactsUiStates[_recordIndex];

      _nutritionFactsUiStates.add(
        NutritionFactsUiState(
          calories: currentUiState.calories,
          fatInGrams: currentUiState.fatInGrams,
          carbsInGrams: currentUiState.carbsInGrams,
          fiberInGrams: currentUiState.fiberInGrams,
          proteinInGrams: currentUiState.proteinInGrams,
        ),
      );

      final newIndex = _nutritionFactsUiStates.length - 1;

      _showRecord(newIndex);

      _perAmountFocusNode.requestFocus();

      widget.onUserInteractionChange?.call();
    }
  }

  void _deleteRecord() {
    final int newIndex;
    if (_recordIndex < _nutritionFactsUiStates.length - 1) {
      newIndex = _recordIndex;
    } else {
      newIndex = _recordIndex - 1;
    }

    _nutritionFactsUiStates.removeAt(_recordIndex);

    _showRecord(newIndex);

    _validate();

    widget.onUserInteractionChange?.call();
  }

  void _loadRecordUiState([int? index]) {
    index = index ?? _recordIndex;

    final uiState = _nutritionFactsUiStates[index];

    _perAmountController.setUnit(uiState.amountUnit);
    _perAmountController.setValue(uiState.amountValue);
    _caloriesAmountController.setValue(uiState.calories);
    _fatAmountController.setValue(uiState.fatInGrams);
    _carbsAmountController.setValue(uiState.carbsInGrams);
    _fiberAmountController.setValue(uiState.fiberInGrams);
    _proteinAmountController.setValue(uiState.proteinInGrams);
  }

  void _saveRecordUiState([int? index]) {
    _form.currentState!.save();

    index = index ?? _recordIndex;

    final uiState = _nutritionFactsUiStates[index];

    _nutritionFactsUiStates[index] = uiState.copyWith(
      amountUnit: _perAmountController.unit!,
      amountValue: _perAmountController.value,
      calories: _caloriesAmountController.value,
      fatInGrams: _fatAmountController.value,
      carbsInGrams: _carbsAmountController.value,
      fiberInGrams: _fiberAmountController.value,
      proteinInGrams: _proteinAmountController.value,
    );
  }

  void _showRecord(int index) {
    _loadRecordUiState(index);
    setState(() {
      _recordIndex = index;
    });
  }

  void _goToRecord(int index) {
    if (_validate()) {
      _showRecord(index);
    }
  }

  void _prevRecord() {
    _goToRecord(_recordIndex - 1);
  }

  void _nextRecord() {
    _goToRecord(_recordIndex + 1);
  }

  String? _validateFiberAmount(String? value) {
    final uiState = _nutritionFactsUiStates[_recordIndex];

    if (uiState.fiberInGrams != null &&
        uiState.carbsInGrams != null &&
        uiState.fiberInGrams! > uiState.carbsInGrams!) {
      return l10n(context).validationErrorMoreFiberThanCarbs;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isLastRecord = _recordIndex == _nutritionFactsUiStates.length - 1;
    final isDeletable = _nutritionFactsUiStates.length > 1;

    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.enabled)
                IconButton(
                  onPressed: !isDeletable ? null : _deleteRecord,
                  icon: const Icon(Icons.remove),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 24,
                ),
              Text(
                l10n(context).titleNutritionFacts,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              if (widget.enabled)
                IconButton(
                  onPressed: !isLastRecord ? null : _addRecord,
                  icon: const Icon(Icons.add),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 24,
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _recordIndex <= 0 ? null : _prevRecord,
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Theme.of(context).colorScheme.secondary,
                iconSize: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AmountInput(
                  controller: _perAmountController,
                  focusNode: _perAmountFocusNode,
                  label: l10n(context).labelPer,
                  enabled: widget.enabled,
                  allowZero: false,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    _caloriesFocusNode.requestFocus();
                  },
                  onUserInteractionChange: widget.onUserInteractionChange,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _recordIndex >= _nutritionFactsUiStates.length - 1
                    ? null
                    : _nextRecord,
                icon: const Icon(Icons.arrow_forward_ios),
                color: Theme.of(context).colorScheme.secondary,
                iconSize: 24,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n(context)
                .mOfN(_recordIndex + 1, _nutritionFactsUiStates.length),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          AmountInput(
            controller: _caloriesAmountController,
            focusNode: _caloriesFocusNode,
            label: l10n(context).labelCalories,
            initialUnit: Unit.calorie,
            fixedUnit: true,
            allowZero: true,
            textInputAction: TextInputAction.next,
            onUserInteractionChange: widget.onUserInteractionChange,
            enabled: widget.enabled,
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AmountInput(
                  controller: _fatAmountController,
                  label: l10n(context).labelFat,
                  initialUnit: Unit.gram,
                  fixedUnit: true,
                  textInputAction: TextInputAction.next,
                  onUserInteractionChange: widget.onUserInteractionChange,
                  enabled: widget.enabled,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AmountInput(
                  controller: _carbsAmountController,
                  label: l10n(context).labelCarbs,
                  initialUnit: Unit.gram,
                  fixedUnit: true,
                  textInputAction: TextInputAction.next,
                  onUserInteractionChange: widget.onUserInteractionChange,
                  enabled: widget.enabled,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AmountInput(
                  controller: _fiberAmountController,
                  label: l10n(context).labelFiber,
                  initialUnit: Unit.gram,
                  fixedUnit: true,
                  textInputAction: TextInputAction.next,
                  validator: _validateFiberAmount,
                  onUserInteractionChange: widget.onUserInteractionChange,
                  enabled: widget.enabled,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AmountInput(
                  controller: _proteinAmountController,
                  label: l10n(context).labelProtein,
                  initialUnit: Unit.gram,
                  fixedUnit: true,
                  textInputAction: TextInputAction.done,
                  onUserInteractionChange: widget.onUserInteractionChange,
                  enabled: widget.enabled,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _NutritionFactsInputControllerCommand {
  load,
  validate,
  save,
}

class NutritionFactsInputController extends ChangeNotifier {
  bool _isValid = false;
  List<NutritionFacts>? _nutritionFacts;

  _NutritionFactsInputControllerCommand? _command;

  NutritionFactsInputController({
    List<NutritionFacts>? nutritionFacts,
  }) : _nutritionFacts = nutritionFacts;

  bool get isValid => _isValid;

  List<NutritionFacts>? get nutritionFacts => _nutritionFacts;

  set nutritionFacts(List<NutritionFacts>? value) {
    _nutritionFacts = value;
    _command = _NutritionFactsInputControllerCommand.load;
    notifyListeners();
  }

  void validate() {
    _command = _NutritionFactsInputControllerCommand.validate;
    notifyListeners();
  }

  void save() {
    _command = _NutritionFactsInputControllerCommand.save;
    notifyListeners();
  }
}
