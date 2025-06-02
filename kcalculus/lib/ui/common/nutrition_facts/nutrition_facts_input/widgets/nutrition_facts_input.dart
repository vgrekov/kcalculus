import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrient_amount_ui_state.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_ui_state.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_view_model.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_view_model_arg.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_ui_state.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/widgets/nutrition_facts_input_header.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/widgets/per_amount_input.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/nutrients/search/widgets/nutrient_search_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutritionFactsInput extends ConsumerStatefulWidget {
  NutritionFactsInput({
    super.key,
    this.nutritionFacts,
    required this.defaultNutrients,
    this.controller,
    this.focusNode,
    this.onUserInteractionChange,
  })  : viewModelArg = NutritionFactsInputViewModelArg(
          nutritionFacts: nutritionFacts ?? controller?._nutritionFacts,
          defaultNutrients: defaultNutrients,
        ),
        defaultNutrientsSet = defaultNutrients.toSet();

  final List<NutritionFacts>? nutritionFacts;

  final List<Nutrient> defaultNutrients;

  final Set<Nutrient> defaultNutrientsSet;

  final NutritionFactsInputController? controller;

  final FocusNode? focusNode;

  final void Function()? onUserInteractionChange;

  final NutritionFactsInputViewModelArg viewModelArg;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NutritionFactsInputState();
  }
}

class _NutritionFactsInputState extends ConsumerState<NutritionFactsInput>
    with StateMessenger {
  final _perAmountController = AmountInputController();

  final _form = GlobalKey<FormState>();

  final _nutrientAmountControllers = <Nutrient, AmountInputController>{};

  late FocusNode _perAmountFocusNode;

  late FocusNode _firstNutrientAmountFocusNode;

  late FocusNode _lastNutrientAmountFocusNode;

  late final _assignments = <NutritionFactsInputCommand, UiAssignment>{
    NutritionFactsInputCommand.showRequiredMissingErrorMessage:
        _showRequiredMissingErrorMessage,
    NutritionFactsInputCommand.showInconsistenceAcrossRecordsErrorMessage:
        _showInconsistenceAcrossRecordsErrorMessage,
    NutritionFactsInputCommand.showPartExceedsWholeErrorMessage:
        _showPartExceedsWholeErrorMessage,
  };

  @override
  void initState() {
    final uiState = ref.read(
      nutritionFactsInputViewModel(widget.viewModelArg),
    );

    _loadNutrientAmountControllers(uiState);

    _loadRecordUiState(uiState.selectedRecordState);

    widget.controller?.addListener(_onControllerCommand);

    _perAmountFocusNode = widget.focusNode ?? FocusNode();
    _firstNutrientAmountFocusNode = FocusNode();
    _lastNutrientAmountFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerCommand);

    _perAmountController.dispose();
    _disposeOfNutrientAmountControllers();

    if (widget.focusNode == null) {
      _perAmountFocusNode.dispose();
    }
    _firstNutrientAmountFocusNode.dispose();
    _lastNutrientAmountFocusNode.dispose();

    super.dispose();
  }

  void _loadNutrientAmountControllers(NutritionFactsInputUiState uiState) {
    final nutrientsWithController = Set.of(_nutrientAmountControllers.keys);

    // Add new ones
    for (final nutrient in uiState.nutrients) {
      if (!nutrientsWithController.remove(nutrient)) {
        _nutrientAmountControllers[nutrient] = AmountInputController();
      }
    }

    // Remove old ones
    for (final nutrient in nutrientsWithController) {
      _nutrientAmountControllers.remove(nutrient)?.dispose();
    }
  }

  void _disposeOfNutrientAmountControllers() {
    for (final amountController in _nutrientAmountControllers.values) {
      amountController.dispose();
    }
  }

  void _loadRecordUiState(NutritionFactsUiState recordState) {
    _perAmountController.setUnit(recordState.perAmountUnit);
    _perAmountController.setValue(recordState.perAmountValue);

    for (final na in recordState.nutrientAmounts) {
      final controller = _nutrientAmountControllers[na.nutrient];
      controller?.setUnit(na.unit);
      controller?.setValue(na.value);
    }
  }

  void _saveRecordUiState() {
    _form.currentState!.save();

    ref
        .read(
          nutritionFactsInputViewModel(widget.viewModelArg).notifier,
        )
        .saveRecordState(
          (rs) => rs.copyWith(
            perAmountUnit: _perAmountController.unit!,
            perAmountValue: _perAmountController.value,
            nutrientAmounts: rs.nutrientAmounts.map(
              (na) {
                final controller = _nutrientAmountControllers[na.nutrient];

                return NutrientAmountUiState(
                  nutrient: na.nutrient,
                  unit: controller?.unit,
                  value: controller?.value,
                );
              },
            ).toList(),
          ),
        );
  }

  void _onControllerCommand() {
    if (widget.controller?._command != null) {
      return switch ((widget.controller?._command)!) {
        _NutritionFactsInputControllerCommand.load => _onControllerLoad(),
        _NutritionFactsInputControllerCommand.validate =>
          _onControllerValidate(),
        _NutritionFactsInputControllerCommand.save => _onControllerSave(),
      };
    }
  }

  void _onControllerLoad() {
    final viewModel = ref.read(
      nutritionFactsInputViewModel(widget.viewModelArg).notifier,
    );

    final uiState = viewModel.load(
      widget.controller!._nutritionFacts,
      widget.defaultNutrients,
    );

    _loadNutrientAmountControllers(uiState);

    _loadRecordUiState(uiState.selectedRecordState);
  }

  void _onControllerValidate() {
    _saveRecordUiState();

    final viewModel = ref.read(
      nutritionFactsInputViewModel(widget.viewModelArg).notifier,
    );

    widget.controller!._isValid =
        _form.currentState!.validate() && viewModel.validate();
  }

  void _onControllerSave() {
    _saveRecordUiState();

    final uiState = ref.read(
      nutritionFactsInputViewModel(widget.viewModelArg),
    );

    widget.controller!._nutritionFacts = uiState.toModels();
  }

  void _addRecord() {
    _saveRecordUiState();

    final added = ref
        .read(
          nutritionFactsInputViewModel(widget.viewModelArg).notifier,
        )
        .addRecord();

    if (added) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _perAmountFocusNode.requestFocus();
      });
    }
  }

  void _deleteRecord() {
    ref
        .read(
          nutritionFactsInputViewModel(widget.viewModelArg).notifier,
        )
        .deleteRecord();
  }

  void _selectPrevRecord() {
    _saveRecordUiState();

    ref
        .read(
          nutritionFactsInputViewModel(widget.viewModelArg).notifier,
        )
        .selectPrevRecord();
  }

  void _selectNextRecord() {
    _saveRecordUiState();

    ref
        .read(
          nutritionFactsInputViewModel(widget.viewModelArg).notifier,
        )
        .selectNextRecord();
  }

  void _addNutrient() async {
    _saveRecordUiState();

    final uiState = ref.read(
      nutritionFactsInputViewModel(widget.viewModelArg),
    );

    final nutrient = await Navigator.of(context).push<Nutrient>(
      MaterialPageRoute(
        builder: (context) => NutrientSearchScreen(
          exceptions: uiState.nutrients,
        ),
      ),
    );

    if (nutrient != null) {
      final added = ref
          .read(
            nutritionFactsInputViewModel(widget.viewModelArg).notifier,
          )
          .addNutrient(nutrient);

      if (added) {
        final controller = AmountInputController();

        controller.setUnit(nutrient.defaultUnit);

        _nutrientAmountControllers[nutrient] = controller;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _lastNutrientAmountFocusNode.requestFocus();
        });
      }
    }
  }

  void _deleteNutrient(Nutrient nutrient) {
    _saveRecordUiState();

    final deleted = ref
        .read(
          nutritionFactsInputViewModel(widget.viewModelArg).notifier,
        )
        .deleteNutrient(nutrient);

    if (deleted) {
      _nutrientAmountControllers.remove(nutrient)?.dispose();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _lastNutrientAmountFocusNode.unfocus();
      });
    }
  }

  void _showRequiredMissingErrorMessage(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final missingNutrients = command.payload as List<Nutrient>;

    showMessage(
      l10n(context).messageRequiredNutrientsMissing(
        missingNutrients
            .map(
              (n) => ' - ${n.localName(l10n(context))}',
            )
            .join('\n'),
      ),
      MessageType.error,
    );

    command.complete();
  }

  void _showInconsistenceAcrossRecordsErrorMessage(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final inconsistentNutrients = command.payload as List<Nutrient>;

    showMessage(
      l10n(context).messageInconsistentNutrients(
        inconsistentNutrients
            .map(
              (n) => ' - ${n.localName(l10n(context))}',
            )
            .join('\n'),
      ),
      MessageType.error,
    );

    command.complete();
  }

  void _showPartExceedsWholeErrorMessage(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final partsExceedingWhole =
        command.payload as List<(NutrientAmount, NutrientAmount)>;

    showMessage(
      l10n(context).messageSubNutrientsExceedTotal(
        partsExceedingWhole.map(
          (pair) {
            final (partNa, wholeNa) = pair;

            return l10n(context).partExceedsWhole(
              partNa.nutrient.localName(l10n(context)),
              partNa.amount.unit.localName(context),
              nb.formatDouble(context, partNa.amount.value),
              wholeNa.nutrient.localName(l10n(context)),
              wholeNa.amount.unit.localName(context),
              nb.formatDouble(context, wholeNa.amount.value),
            );
          },
        ).join('\n'),
      ),
      MessageType.error,
    );

    command.complete();
  }

  List<Widget> _buildNutrientAmountInput({
    required Nutrient nutrient,
    required bool isFirst,
    required bool isLast,
  }) {
    return [
      Row(
        children: [
          const SizedBox(width: 40),
          Expanded(
            child: AmountInput(
              key: ValueKey(nutrient),
              controller: _nutrientAmountControllers[nutrient],
              focusNode: isFirst
                  ? _firstNutrientAmountFocusNode
                  : isLast
                      ? _lastNutrientAmountFocusNode
                      : null,
              label: nutrient.localName(l10n(context)) +
                  (nutrient.required ? ' *' : ''),
              fixedMeasure: nutrient.defaultUnit.measure,
              required: nutrient.required,
              allowZero: true,
              textInputAction:
                  isLast ? TextInputAction.done : TextInputAction.next,
              onUserInteractionChange: widget.onUserInteractionChange,
            ),
          ),
          widget.defaultNutrientsSet.contains(nutrient)
              ? const SizedBox(width: 40)
              : SizedBox(
                  width: 40,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: IconButton(
                      onPressed: () {
                        _deleteNutrient(nutrient);
                      },
                      icon: const Icon(Icons.cancel),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
        ],
      ),
      const SizedBox(height: 12),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(
      nutritionFactsInputViewModel(widget.viewModelArg).select(
        (state) => state.nutrients,
      ),
    );

    ref.listen(
      nutritionFactsInputViewModel(widget.viewModelArg)
          .select((s) => s.selectedRecordState),
      (previous, next) {
        _loadRecordUiState(next);
      },
    );

    final uiState = ref.read(
      nutritionFactsInputViewModel(widget.viewModelArg),
    );

    final viewModel = ref.read(
      nutritionFactsInputViewModel(widget.viewModelArg).notifier,
    );

    return UiSubordinate<NutritionFactsInputCommand>(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NutritionFactsInputHeader(
              viewModelArg: widget.viewModelArg,
              onAddRecord: _addRecord,
              onDeleteRecord: _deleteRecord,
            ),
            const SizedBox(height: 8),
            PerAmountInput(
              viewModelArg: widget.viewModelArg,
              controller: _perAmountController,
              focusNode: _perAmountFocusNode,
              onPrevRecord: _selectPrevRecord,
              onNextRecord: _selectNextRecord,
            ),
            const SizedBox(height: 16),
            ...[
              for (final (index, nutrient) in uiState.nutrients.indexed)
                _buildNutrientAmountInput(
                    nutrient: nutrient,
                    isFirst: index == 0,
                    isLast: index == uiState.nutrients.length - 1),
            ].expand((e) => e),
            OutlinedButton(
              onPressed: _addNutrient,
              child: Text(
                l10n(context).labelAddNutrient,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
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
  NutritionFactsInputController({
    List<NutritionFacts>? nutritionFacts,
  }) : _nutritionFacts = nutritionFacts;

  bool _isValid = false;

  List<NutritionFacts>? _nutritionFacts;

  _NutritionFactsInputControllerCommand? _command;

  void load(List<NutritionFacts>? value) {
    _nutritionFacts = value;

    _command = _NutritionFactsInputControllerCommand.load;

    notifyListeners();
  }

  bool validate() {
    _isValid = false;

    _command = _NutritionFactsInputControllerCommand.validate;

    notifyListeners();

    return _isValid;
  }

  List<NutritionFacts>? save() {
    _nutritionFacts = null;

    _command = _NutritionFactsInputControllerCommand.save;

    notifyListeners();

    return _nutritionFacts;
  }
}
