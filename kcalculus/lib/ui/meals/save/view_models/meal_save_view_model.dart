import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_ui_state.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_view_model_arg.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('MealSaveViewModel');

enum MealSaveCommand {
  showUnknownErrorNotification,
  exit,
}

class MealSaveViewModel
    extends AutoDisposeFamilyNotifier<MealSaveUiState, MealSaveViewModelArg> {
  UiCommander<MealSaveCommand>? _commander;

  @override
  MealSaveUiState build(MealSaveViewModelArg arg) {
    _commander = UiCommander<MealSaveCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    if (arg.meal != null) {
      return MealSaveUiState.fromMeal(arg.meal!);
    } else if (arg.date != null) {
      final now = DateTime.now();
      return MealSaveUiState(
        eatenAt: now.copyWith(
          year: arg.date!.year,
          month: arg.date!.month,
          day: arg.date!.day,
        ),
      );
    }

    return MealSaveUiState();
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
    .autoDispose<MealSaveViewModel, MealSaveUiState, MealSaveViewModelArg>(
  MealSaveViewModel.new,
);
