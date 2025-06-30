import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/nutrients/goals/list/view_models/nutrient_goal_list_view_model.dart';
import 'package:kcalculus/ui/nutrients/goals/list/widgets/nutrient_goal_list.dart';
import 'package:kcalculus/ui/nutrients/goals/save/widgets/nutrient_goal_save_screen.dart';
import 'package:kcalculus/ui/nutrients/search/widgets/nutrient_search_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final _log = Logger('NutrientGoalListScreen');

class NutrientGoalListScreen extends ConsumerWidget with WidgetMessenger {
  NutrientGoalListScreen({super.key});

  late final _assignments = <NutrientGoalListCommand, UiAssignment>{
    NutrientGoalListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    NutrientGoalListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    NutrientGoalListCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  void _addGoal(BuildContext context, WidgetRef ref) {
    final uiState = ref.read(nutrientGoalListViewModel);
    uiState.whenData((data) async {
      final nutrient = await Navigator.of(context).push<Nutrient>(
        MaterialPageRoute(
          builder: (context) => NutrientSearchScreen(
            exceptions: data.map((goal) => goal.nutrient).toList(),
          ),
        ),
      );

      if (nutrient != null && context.mounted) {
        final result = await Navigator.of(context).push<NutrientGoal>(
          MaterialPageRoute(
            builder: (context) => NutrientGoalSaveScreen.add(
              nutrient: nutrient,
            ),
          ),
        );

        if (result != null && context.mounted) {
          ProgressOverlay.wrap(
            context,
            ref.read(nutrientGoalListViewModel.notifier).saveGoal(result),
          );
        }
      }
    });
  }

  void _editGoal(
    BuildContext context,
    WidgetRef ref,
    NutrientGoal goal,
  ) async {
    final result = await Navigator.of(context).push<NutrientGoal>(
      MaterialPageRoute(
        builder: (context) => NutrientGoalSaveScreen.edit(
          goal: goal,
        ),
      ),
    );

    if (result != null && context.mounted) {
      ProgressOverlay.wrap(
        context,
        ref.read(nutrientGoalListViewModel.notifier).saveGoal(result),
      );
    }
  }

  void _deleteGoal(BuildContext context, WidgetRef ref, NutrientGoal goal) {
    ProgressOverlay.wrap(
      context,
      ref.read(nutrientGoalListViewModel.notifier).deleteGoal(goal),
    );
  }

  void _restoreGoal(BuildContext context, WidgetRef ref, NutrientGoal goal) {
    ProgressOverlay.wrap(
      context,
      ref.read(nutrientGoalListViewModel.notifier).restoreGoal(goal),
    );
  }

  void _showDeletionSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotificationWithUndo(
      context,
      l10n(context).messageNutrientGoalDeletionSuccess,
      undoAction: () {
        _restoreGoal(context, ref, command.payload as NutrientGoal);
      },
    );
    command.complete();
  }

  void _showDeletionFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(
      context,
      l10n(context).messageNutrientGoalDeletionFailure,
    );
    command.complete();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(
      context,
      l10n(context).messageUnknownError,
    );
    command.complete();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(nutrientGoalListViewModel);

    final viewModel = ref.read(nutrientGoalListViewModel.notifier);

    return UiSubordinate<NutrientGoalListCommand>(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n(context).screenNutrientGoals,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        body: SafeArea(
          child: uiState.when(
            data: (data) {
              if (data.isNotEmpty) {
                return NutrientGoalList(
                  items: data,
                  onSelectItem: (item) {
                    _editGoal(context, ref, item);
                  },
                  onDeleteItem: (item) {
                    _deleteGoal(context, ref, item);
                  },
                );
              } else {
                return Center(
                  child: Text(
                    l10n(context).messageNutrientGoalshNoData,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                );
              }
            },
            error: (error, stackTrace) {
              _log.severe('Failed to load nutrient goals', error, stackTrace);

              return Center(
                child: Text(
                  l10n(context).messageUnknownError,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              );
            },
            loading: () => const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
        floatingActionButton: uiState.whenOrNull(
          data: (_) => FloatingActionButton(
            onPressed: () {
              _addGoal(context, ref);
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
