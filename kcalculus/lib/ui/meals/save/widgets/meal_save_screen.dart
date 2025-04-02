import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/ui/common/portion_form/widgets/portion_form.dart';
import 'package:kcalculus/ui/common/utils/ads.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/date_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/time_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';

class MealSaveScreen extends ConsumerStatefulWidget {
  const MealSaveScreen({
    super.key,
    this.meal,
  });

  final Meal? meal;

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
    MealSaveCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
    MealSaveCommand.exit: _exitOnCommand,
  };

  @override
  void initState() {
    final uiState = ref.read(mealSaveViewModel(widget.meal));

    _dateController.dateTime = uiState.eatenAt;
    _timeController.dateTime = uiState.eatenAt;
    _portionFormController.setPortion(uiState.portion);

    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _portionFormController.dispose();

    super.dispose();
  }

  void _saveMeal() async {
    _portionFormController.validate();
    if (!_portionFormController.isValid) {
      return;
    }

    _portionFormController.save();

    final portion = await _portionFormController.getPortion();
    if (portion != null) {
      final date = _dateController.dateTime;
      final time = _timeController.dateTime;

      final viewModel = ref.read(mealSaveViewModel(widget.meal).notifier);

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
          viewModel.saveMeal(),
        );

        if (saved) {
          await showInterstitialAd(ref);
        }
      }
    }
  }

  void _exit() {
    Navigator.of(context).pop();
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
    _exit();
    command?.complete();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(mealSaveViewModel(widget.meal));

    return UiSubordinate<MealSaveCommand>(
      commandProvider:
          ref.read(mealSaveViewModel(widget.meal).notifier).commandProvider,
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
              widget.meal?.id == null
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
