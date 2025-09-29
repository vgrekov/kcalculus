import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/portion.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_ui_state.dart';
import 'package:kcalculus/ui/meals/save/view_models/meal_save_view_model_arg.dart';
import 'package:kcalculus/utils/double_ext.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('MealSaveViewModel');

enum MealSaveCommand {
  showExceededEnergyGoalDialog,
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

  Future<bool> saveMeal({bool force = false}) async {
    _log.finer('saveMeal() START');

    bool result = false;

    try {
      Meal meal = state.toMeal();

      if (force || await _checkForEnergyGoalExceeding(meal)) {
        _log.finest('saveMeal() Saving meal: ${meal.toJson()}');

        meal = await ref.read(mealRepositoryProvider.notifier).save(meal);

        result = true;

        _log.info('Meal saved');
        _log.finest('saveMeal() Saved meal ID: ${meal.id}');
        _log.eventMealSave();

        _commander!.send<Meal?, void>(
          MealSaveCommand.exit,
          payload: meal,
        );
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to save a meal', error, stackTrace);

      _commander!.send(MealSaveCommand.showUnknownErrorNotification);
    }

    _log.finer('saveMeal() END');

    return result;
  }

  Future<bool> _checkForEnergyGoalExceeding(Meal meal) async {
    final goals = await ref
        .read(nutrientGoalRepositoryProvider.notifier)
        .getActiveGoals(state.eatenAt);
    final goalEnergyAmount = goals
        .where(
          (goal) => goal.nutrient == Nutrient.energy,
        )
        .firstOrNull
        ?.amount;

    if (goalEnergyAmount != null) {
      final meals = await ref
          .read(mealRepositoryProvider.notifier)
          .getByDate(state.eatenAt);
      final currentNutrientData = meals
          .where((meal) => meal.id != state.id)
          .map((m) => m.getNutrientData() ?? NutrientData.empty())
          .fold(
            NutrientData.zeros(const [Nutrient.energy]),
            (nd1, nd2) => nd1 + nd2,
          );
      final currentEnergyAmount =
          currentNutrientData.nutrientAmountsMap[Nutrient.energy];

      final portionNutrientData = meal.getNutrientData();
      final portionEnergyAmount =
          portionNutrientData?.nutrientAmountsMap[Nutrient.energy];

      if (currentEnergyAmount != null &&
          portionEnergyAmount != null &&
          currentEnergyAmount <= goalEnergyAmount &&
          (currentEnergyAmount + portionEnergyAmount) > goalEnergyAmount) {
        final aboveGoalEnergyAmount =
            (currentEnergyAmount + portionEnergyAmount) - goalEnergyAmount;

        final factor = 1 -
            aboveGoalEnergyAmount.convert(Unit.calorie).value /
                portionEnergyAmount.convert(Unit.calorie).value;

        var adjustedPortionAmountValue =
            (meal.amount.value * factor).withPrecision(2, false);
        if (meal.amount.unit == Unit.piece) {
          adjustedPortionAmountValue =
              adjustedPortionAmountValue.floorToDouble();
        }

        // We only show 2 digits after a dot, so < 0.01 pretty much means zero
        final adjustedPortion = adjustedPortionAmountValue >= 0.01
            ? meal.copyWith.amount(
                value: adjustedPortionAmountValue,
              )
            : null;

        _commander!.send<Portion?, void>(
          MealSaveCommand.showExceededEnergyGoalDialog,
          payload: adjustedPortion,
        );

        return false;
      }
    }

    return true;
  }
}

final mealSaveViewModel = NotifierProvider.family
    .autoDispose<MealSaveViewModel, MealSaveUiState, MealSaveViewModelArg>(
  MealSaveViewModel.new,
);
