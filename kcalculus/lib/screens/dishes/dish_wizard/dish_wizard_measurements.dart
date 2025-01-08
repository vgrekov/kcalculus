import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard_measurements.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/nutrition_ratio_input.dart';

class DishWizardMeasurementsPage extends ConsumerStatefulWidget {
  const DishWizardMeasurementsPage({super.key});

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

  MeasurementsStepStateValidationResult? _stateValidationResult;

  @override
  bool validate(BuildContext context, WidgetRef ref) {
    _stateValidationResult =
        ref.read(dishWizardProvider).data.measurementsStepState.validate();

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

    ref.read(dishWizardProvider.notifier).triggerStateChange();
  }

  void _saveState() {
    _form.currentState!.save();

    final stepState = ref.read(dishWizardProvider).data.measurementsStepState;
    final enabledRatioStates =
        stepState.nutritionRatioStates.where((rs) => rs.enabled);
    for (final ratioState in enabledRatioStates) {
      final controllers = _ratioControllers[ratioState.measure];
      if (controllers != null) {
        ratioState.perAmountUnit = controllers.perAmountController.unit;
        ratioState.perAmountValue = controllers.perAmountController.value;

        ratioState.totalAmountUnit = controllers.totalAmountController.unit;
        ratioState.totalAmountValue = controllers.totalAmountController.value;
      }
    }
  }

  void _loadControllersFromState(
      List<NutritionRatioState> nutritionRatioStates) {
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
    ref
        .read(dishWizardProvider)
        .data
        .measurementsStepState
        .toggleMeasure(measure);
  }

  String? _validatePerAmount(Measure measure) {
    final ratioValidationResult =
        _stateValidationResult?.ratioStateValidationResults[measure];
    switch (ratioValidationResult) {
      case NutritionRatioStateValidationResult.perAmountMissing:
      case NutritionRatioStateValidationResult.bothAmountsMissing:
        return l10n(context).validationErrorAmountValueMissing;
      case NutritionRatioStateValidationResult.perAmountHasWrongMeasure:
      case NutritionRatioStateValidationResult.bothAmountsHaveWrongMeasure:
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
      case NutritionRatioStateValidationResult.totalAmountMissing:
      case NutritionRatioStateValidationResult.bothAmountsMissing:
        return l10n(context).validationErrorAmountValueMissing;
      case NutritionRatioStateValidationResult.totalAmountHasWrongMeasure:
      case NutritionRatioStateValidationResult.bothAmountsHaveWrongMeasure:
        return l10n(context)
            .validationErrorAmountMustBeOfMeasure(measure.localName(context));
      default:
        return null;
    }
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
    final wizardState = ref.watch(dishWizardProvider).data;
    final stepState = wizardState.measurementsStepState;

    _loadControllersFromState(stepState.nutritionRatioStates);

    final List<Widget> ratioWidgets = [];
    for (final ratioState in stepState.nutritionRatioStates) {
      final estimatedTotalAmount =
          wizardState.estimateTotalAmount(ratioState.measure);

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
