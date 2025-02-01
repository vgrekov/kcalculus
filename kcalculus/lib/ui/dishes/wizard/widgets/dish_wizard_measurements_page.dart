import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/ui/common/widgets/nutrition_ratio_input.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_measurements_step_ui_state/dish_wizard_measurements_step_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_measurements_step_ui_state/nutrition_ratio_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';

class DishWizardMeasurementsPage extends ConsumerStatefulWidget {
  const DishWizardMeasurementsPage({
    super.key,
    this.dish,
  });

  final Dish? dish;

  @override
  ConsumerState<DishWizardMeasurementsPage> createState() {
    return _DishWizardMeasurementsPageState();
  }
}

class _DishWizardMeasurementsPageState
    extends ConsumerState<DishWizardMeasurementsPage>
    with StateMessenger
    implements DishWizardPage {
  final _form = GlobalKey<FormState>();

  final Map<Measure, _NutritionRatioControllers> _ratioControllers = {
    for (final measure in Measure.pickableValues)
      measure: _NutritionRatioControllers()
  };

  MeasurementsStepValidationResult? _stateValidationResult;

  @override
  bool validate(BuildContext context, WidgetRef ref) {
    _stateValidationResult = ref
        .read(dishWizardViewModel(widget.dish))
        .measurementsStepState
        .validate();

    final formValidationResult = _form.currentState!.validate();

    if (_stateValidationResult?.measurementsMissing == true) {
      showNotification(l10n(context).messageDishSelectMeasurementOptionError);
      return false;
    }

    return formValidationResult;
  }

  @override
  void save(BuildContext context, WidgetRef ref) {
    _saveState();

    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _saveState() {
    _form.currentState!.save();

    final viewModel = ref.read(dishWizardViewModel(widget.dish).notifier);

    final newRatioStates = _ratioControllers.entries
        .map(
          (e) => NutritionRatioUiState(
            measure: e.key,
            totalAmountUnit: e.value.totalAmountController.unit,
            totalAmountValue: e.value.totalAmountController.value,
            perAmountUnit: e.value.perAmountController.unit,
            perAmountValue: e.value.perAmountController.value,
          ),
        )
        .toList();

    viewModel.updateMeasurementsStepData(newRatioStates);
  }

  void _loadControllersFromState(
      List<NutritionRatioUiState> nutritionRatioStates) {
    for (final ratioState in nutritionRatioStates) {
      final controllers = _ratioControllers[ratioState.measure];
      if (controllers != null) {
        controllers.perAmountController.setUnit(ratioState.perAmountUnit);
        controllers.perAmountController.setValue(ratioState.perAmountValue);

        controllers.totalAmountController.setUnit(ratioState.totalAmountUnit);
        controllers.totalAmountController.setValue(ratioState.totalAmountValue);
      }
    }
  }

  void _toggleMeasure(Measure measure) {
    _saveState();
    ref.read(dishWizardViewModel(widget.dish).notifier).toggleMeasure(measure);
  }

  String? _validatePerAmount(Measure measure) {
    final ratioValidationResult =
        _stateValidationResult?.ratioStateValidationResults[measure];
    switch (ratioValidationResult) {
      case NutritionRatioValidationResult.perAmountMissing:
      case NutritionRatioValidationResult.bothAmountsMissing:
        return l10n(context).validationErrorAmountValueMissing;
      case NutritionRatioValidationResult.perAmountHasWrongMeasure:
      case NutritionRatioValidationResult.bothAmountsHaveWrongMeasure:
        return l10n(context)
            .validationErrorAmountMustBeOfMeasure(measure.localName(context));
      default:
        return null;
    }
  }

  String? _validateTotalAmount(Measure measure) {
    final ratioValidationResult =
        _stateValidationResult?.ratioStateValidationResults[measure];
    switch (ratioValidationResult) {
      case NutritionRatioValidationResult.totalAmountMissing:
      case NutritionRatioValidationResult.bothAmountsMissing:
        return l10n(context).validationErrorAmountValueMissing;
      case NutritionRatioValidationResult.totalAmountHasWrongMeasure:
      case NutritionRatioValidationResult.bothAmountsHaveWrongMeasure:
        return l10n(context)
            .validationErrorAmountMustBeOfMeasure(measure.localName(context));
      default:
        return null;
    }
  }

  void _onUserInteractionChange() {
    ref
        .read(dishWizardViewModel(widget.dish).notifier)
        .onUserInteractionChange();
  }

  @override
  void dispose() {
    for (final controllers in _ratioControllers.values) {
      controllers.dispose();
    }

    super.dispose();
  }

  @override
  ScaffoldConfig? buildScaffoldConfig(BuildContext context, WidgetRef ref) {
    return ScaffoldConfig(
      subtitle: l10n(context).dishWizardPageMeasurements,
    );
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(dishWizardViewModel(widget.dish));

    final stepState = uiState.measurementsStepState;

    _loadControllersFromState(stepState.nutritionRatioStates);

    final List<Widget> ratioWidgets = [];
    for (final ratioState in stepState.nutritionRatioStates) {
      final estimatedTotalAmount =
          uiState.estimateTotalAmount(ratioState.measure);

      final controllers = _ratioControllers[ratioState.measure];

      final ratioWidget = NutritionRatioInput(
        measure: ratioState.measure,
        estimatedTotalAmount: estimatedTotalAmount,
        totalAmountController: controllers?.totalAmountController,
        totalAmountValidator: (_) {
          return _validateTotalAmount(ratioState.measure);
        },
        perAmountController: controllers?.perAmountController,
        perAmountValidator: (_) {
          return _validatePerAmount(ratioState.measure);
        },
        enabled: ratioState.enabled,
        onToggleEnabled: _toggleMeasure,
        onUserInteractionChange: _onUserInteractionChange,
      );

      ratioWidgets.add(ratioWidget);
      ratioWidgets.add(const Divider(height: 0));
    }

    return SingleChildScrollView(
      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ratioWidgets,
        ),
      ),
    );
  }
}

class _NutritionRatioControllers {
  AmountInputController perAmountController;
  AmountInputController totalAmountController;

  _NutritionRatioControllers()
      : perAmountController = AmountInputController(),
        totalAmountController = AmountInputController();

  void dispose() {
    perAmountController.dispose();
    totalAmountController.dispose();
  }
}
