import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ingredients_step_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_main_step_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_measurements_step_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';

enum DishSaveCommand {
  showUnknownErrorNotification,
  showEdibleAlreadyExistsDialog,
  goToInvalidStep,
  confirmDiscardChanges,
  exit,
}

class DishWizardViewModel
    extends AutoDisposeFamilyNotifier<DishWizardUiState, Dish?>
    with
        DishWizardMainStepViewModel,
        DishWizardIngredientsStepViewModel,
        DishWizardMeasurementsStepViewModel {
  UiCommander<DishSaveCommand>? _commander;

  bool _hasChanges = false;

  @override
  DishWizardUiState build(Dish? arg) {
    _commander = UiCommander<DishSaveCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    if (arg != null) {
      return DishWizardUiState.fromDish(arg);
    }

    return DishWizardUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> saveFood() async {
    try {
      final validationResult = state.validate();
      final invalidStep =
          validationResult.entries.where((e) => !e.value).firstOrNull?.key;
      if (invalidStep != null) {
        _commander!.send<DishWizardStep, void>(
          DishSaveCommand.showEdibleAlreadyExistsDialog,
        );
        return;
      }

      final alreadyExists = await _alreadyExists();
      if (alreadyExists) {
        _commander!.send(DishSaveCommand.showEdibleAlreadyExistsDialog);
        return;
      }

      final dish = state.toDish();
      await ref.read(dishRepositoryProvider).save(dish);

      _commander!.send(DishSaveCommand.exit);
    } catch (error) {
      print(error);
      _commander!.send(DishSaveCommand.showUnknownErrorNotification);
    }
  }

  Future<bool> _alreadyExists() {
    return ref.read(edibleRepositoryProvider).exists(
          state.mainStepState.name,
          state.mainStepState.description,
          exceptWithId: state.id,
        );
  }

  Future<bool> shouldExit() async {
    final bool? result;
    if (_hasChanges) {
      result = await _commander!.send<void, bool?>(
        DishSaveCommand.confirmDiscardChanges,
      );
    } else {
      result = true;
    }

    return result == true;
  }

  void onUserInteractionChange() {
    _hasChanges = true;
  }
}

final dishWizardViewModel = NotifierProvider.autoDispose
    .family<DishWizardViewModel, DishWizardUiState, Dish?>(
  DishWizardViewModel.new,
);
