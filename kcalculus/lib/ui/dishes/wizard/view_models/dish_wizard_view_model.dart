import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/exceptions/duplication_exception.dart';
import 'package:kcalculus/data/exceptions/ingredients_cycle_exception.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/ui/common/view_models/ad_helper.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ingredients_step_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_main_step_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_measurements_step_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('DishWizardViewModel');

enum DishWizardCommand {
  showUnknownErrorNotification,
  showEdibleAlreadyExistsDialog,
  showIngredientsCycleDetectedNotification,
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
  UiCommander<DishWizardCommand>? _commander;

  late final _adHelper = AdHelper(getRef: () => ref);

  bool _hasChanges = false;

  @override
  DishWizardUiState build(Dish? arg) {
    _commander = UiCommander<DishWizardCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    if (arg != null) {
      return DishWizardUiState.fromDish(arg);
    }

    return DishWizardUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> saveDish() async {
    _log.finer('saveDish() START');

    try {
      _log.finer('saveDish() Validating UI state');

      final validationResult = state.validate();
      final invalidStep =
          validationResult.entries.where((e) => !e.value).firstOrNull?.key;
      if (invalidStep != null) {
        _log.finer(
            'saveDish() Validation failed for step: ${invalidStep.name}');

        _commander!.send<DishWizardStep, void>(
          DishWizardCommand.goToInvalidStep,
          payload: invalidStep,
        );
        return;
      }

      _log.finer('saveDish() Validation success');

      var dish = state.toDish();

      _log.finest('saveDish() Saving dish: ${dish.toJson()}');

      dish = await ref.read(dishRepositoryProvider).save(dish);

      _log.info('Dish saved');
      _log.finest('saveDish() Saved dish ID: ${dish.id}');

      await _adHelper.showInterstitialAd();

      _commander!.send(DishWizardCommand.exit);
    } on DuplicationException {
      _log.info('Edible already exists');

      _commander!.send(DishWizardCommand.showEdibleAlreadyExistsDialog);
    } on IngredientsCycleException {
      _commander!
          .send(DishWizardCommand.showIngredientsCycleDetectedNotification);
    } catch (error, stackTrace) {
      _log.severe('Failed to save dish', error, stackTrace);

      _commander!.send(DishWizardCommand.showUnknownErrorNotification);
    }

    _log.finer('saveDish() END');
  }

  Future<bool> shouldExit() async {
    final bool? result;
    if (_hasChanges) {
      result = await _commander!.send<void, bool?>(
        DishWizardCommand.confirmDiscardChanges,
      );
    } else {
      result = true;
    }

    return result == true;
  }

  @override
  void onUserInteractionChange() {
    _hasChanges = true;
  }
}

final dishWizardViewModel = NotifierProvider.autoDispose
    .family<DishWizardViewModel, DishWizardUiState, Dish?>(
  DishWizardViewModel.new,
);
