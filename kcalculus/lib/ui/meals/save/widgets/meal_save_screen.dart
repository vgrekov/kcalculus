import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/edible/models/portion.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/portion_form/widgets/portion_form.dart';
import 'package:kcalculus/ui/common/utils/ads.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/date_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/time_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/meals/save/view_models/exceeded_goal_option.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_ui_state.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_view_model.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_view_model_arg.dart';
import 'package:kcalculus/utils/l10n.dart';

class MealSaveScreen extends ConsumerStatefulWidget {
  MealSaveScreen({
    super.key,
    Meal? meal,
    DateTime? date,
    required this.nutrientDefaults,
  }) : _viewModelArg = MealSaveViewModelArg(
          meal: meal,
          date: date,
        ) {
    if (meal != null && date != null) {
      throw 'When a meal is specified, date must be null.';
    }
  }

  final List<Nutrient> nutrientDefaults;

  final MealSaveViewModelArg _viewModelArg;

  @override
  ConsumerState createState() {
    return _MealSaveScreenState();
  }
}

class _MealSaveScreenState extends ConsumerState<MealSaveScreen>
    with StateMessenger {
  final _dateController = DateInputController();

  final _timeController = TimeInputController();

  final _portionFormController = PortionFormController();

  late final _assignments = <MealSaveCommand, UiAssignment>{
    MealSaveCommand.showExceededEnergyGoalDialog: _showExceededEnergyGoalDialog,
    MealSaveCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
    MealSaveCommand.exit: _exitOnCommand,
  };

  @override
  void initState() {
    final uiState = ref.read(mealSaveViewModel(widget._viewModelArg));

    _loadUiState(uiState);

    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _portionFormController.dispose();

    super.dispose();
  }

  void _loadUiState(MealSaveUiState uiState) {
    _dateController.dateTime = uiState.eatenAt;
    _timeController.dateTime = uiState.eatenAt;
    _portionFormController.setPortion(uiState.portion);
  }

  void _saveMeal({bool force = false}) async {
    _portionFormController.validate();
    if (!_portionFormController.isValid) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    _portionFormController.save();

    final portion = await _portionFormController.getPortion();
    if (portion != null) {
      final date = _dateController.dateTime;
      final time = _timeController.dateTime;

      final viewModel =
          ref.read(mealSaveViewModel(widget._viewModelArg).notifier);

      viewModel.updateState(
        (state) => state.copyWith(
          eatenAt: date.copyWith(
            hour: time.hour,
            minute: time.minute,
            second: 0,
            microsecond: 0,
            millisecond: 0,
          ),
          portion: portion,
        ),
      );

      if (mounted) {
        final saved = await ProgressOverlay.wrap(
          context,
          viewModel.saveMeal(force: force),
        );

        if (saved) {
          await showInterstitialAd(ref);
        }
      }
    }
  }

  void _exit([Meal? meal]) {
    Navigator.of(context).pop(meal);
  }

  void _showExceededEnergyGoalDialog(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final adjustedPortion = command.payload as Portion?;

    final String message = adjustedPortion != null
        ? l10n(context).messageExceededEnergyGoalAdjustableConfirmation
        : l10n(context).messageExceededEnergyGoalConfirmation;

    final actions = {
      l10n(context).actionCancel: () => null,
      if (adjustedPortion != null)
        l10n(context).actionAdjust: () => ExceededGoalOption.adjust,
      l10n(context).actionProceed: () => ExceededGoalOption.proceed,
    };

    final option = await showMessageDialog<ExceededGoalOption>(
      message: message,
      actions: actions,
      messageType: MessageType.warning,
    );

    command.complete();

    switch (option) {
      case ExceededGoalOption.adjust:
        _portionFormController.setPortion(adjustedPortion);
        break;
      case ExceededGoalOption.proceed:
        _saveMeal(force: true);
        break;
      default:
    }
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  void _exitOnCommand(
    UiCommand? command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    _exit(command?.payload as Meal?);
    command?.complete();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      mealSaveViewModel(widget._viewModelArg),
      (previous, next) {
        _loadUiState(next);
      },
    );

    return UiSubordinate<MealSaveCommand>(
      commandProvider: ref
          .read(mealSaveViewModel(widget._viewModelArg).notifier)
          .commandProvider,
      assignments: _assignments,
      child: Inattentive(
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
              widget._viewModelArg.meal?.id == null
                  ? l10n(context).screenNewMeal
                  : l10n(context).screenEditMeal,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            actions: [
              TextButton(
                onPressed: _saveMeal,
                child: Text(
                  l10n(context).actionSave,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DateInput(
                        controller: _dateController,
                      ),
                      const SizedBox(width: 8),
                      TimeInput(
                        controller: _timeController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  PortionForm(
                    controller: _portionFormController,
                    nutrientDefaults: widget.nutrientDefaults,
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
