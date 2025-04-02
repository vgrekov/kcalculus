import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_ui_state.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('MealSaveViewModel');

enum MealSaveCommand {
  showUnknownErrorNotification,
  exit,
}

class MealSaveViewModel
    extends AutoDisposeFamilyNotifier<MealSaveUiState, Meal?> {
  UiCommander<MealSaveCommand>? _commander;

  @override
  MealSaveUiState build(Meal? arg) {
    _commander = UiCommander<MealSaveCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return arg != null ? MealSaveUiState.fromMeal(arg) : MealSaveUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void updateState(
    MealSaveUiState Function(MealSaveUiState state) update,
  ) {
    state = update(state);
  }

  Future<bool> saveMeal() async {
    _log.finer('saveMeal() START');

    bool result = false;

    try {
      Meal meal = state.toMeal();

      _log.finest('saveMeal() Saving meal: ${meal.toJson()}');

      meal = await ref.read(mealRepositoryProvider).save(meal);

      result = true;

      _log.info('Meal saved');
      _log.finest('saveMeal() Saved meal ID: ${meal.id}');
      _log.eventMealSave();

      _commander!.send(MealSaveCommand.exit);
    } catch (error, stackTrace) {
      _log.severe('Failed to save a meal', error, stackTrace);

      _commander!.send(MealSaveCommand.showUnknownErrorNotification);
    }

    _log.finer('saveMeal() END');

    return result;
  }
}

final mealSaveViewModel = NotifierProvider.family
    .autoDispose<MealSaveViewModel, MealSaveUiState, Meal?>(
  MealSaveViewModel.new,
);
