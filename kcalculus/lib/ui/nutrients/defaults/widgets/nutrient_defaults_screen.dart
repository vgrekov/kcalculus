import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/nutrients/defaults/view_models/nutrient_defaults_view_model.dart';
import 'package:kcalculus/ui/nutrients/defaults/widgets/nutrient_defaults_list.dart';
import 'package:kcalculus/ui/nutrients/search/widgets/nutrient_search_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientDefaultsScreen extends ConsumerWidget with WidgetMessenger {
  NutrientDefaultsScreen({super.key});

  late final _assignments = <NutrientDefaultsCommand, UiAssignment>{
    NutrientDefaultsCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    NutrientDefaultsCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    NutrientDefaultsCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  void _addNutrient(BuildContext context, WidgetRef ref) {
    final uiState = ref.read(nutrientDefaultsViewModel);
    uiState.whenData((data) async {
      final nutrient = await Navigator.of(context).push<Nutrient>(
        MaterialPageRoute(
          builder: (context) => NutrientSearchScreen(
            exceptions: data,
          ),
        ),
      );

      if (nutrient != null) {
        ref.read(nutrientDefaultsViewModel.notifier).addNutrient(nutrient);
      }
    });
  }

  void _deleteNutrient(BuildContext context, WidgetRef ref, Nutrient nutrient) {
    ProgressOverlay.wrap(
      context,
      ref.read(nutrientDefaultsViewModel.notifier).deleteNutrient(nutrient),
    );
  }

  void _restoreNutrient(
      BuildContext context, WidgetRef ref, Nutrient nutrient, int index) {
    ProgressOverlay.wrap(
      context,
      ref
          .read(nutrientDefaultsViewModel.notifier)
          .restoreNutrient(nutrient, index),
    );
  }

  void _reorderNutrients(
      BuildContext context, WidgetRef ref, int oldIndex, int newIndex) async {
    ref
        .read(nutrientDefaultsViewModel.notifier)
        .reorderNutrients(oldIndex, newIndex);
  }

  void _showDeletionSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotificationWithUndo(
      context,
      l10n(context).messageDefaultNutrientDeletionSuccess,
      undoAction: () {
        final (Nutrient, int) payload = command.payload;
        _restoreNutrient(context, ref, payload.$1, payload.$2);
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
      l10n(context).messageDefaultNutrientDeletionFailure,
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
    final uiState = ref.watch(nutrientDefaultsViewModel);

    return uiState.when(
      data: (data) {
        final viewModel = ref.read(nutrientDefaultsViewModel.notifier);

        return UiSubordinate<NutrientDefaultsCommand>(
          commandProvider: viewModel.commandProvider,
          assignments: _assignments,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                l10n(context).screenDefaultNutrients,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            body: SafeArea(
              child: NutrientDefaultsList(
                items: data,
                onDeleteItem: (item) {
                  _deleteNutrient(context, ref, item);
                },
                onReorderItems: (oldIndex, newIndex) {
                  _reorderNutrients(context, ref, oldIndex, newIndex);
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _addNutrient(context, ref);
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
        );
      },
      error: (_, __) => Center(
        child: Text(
          l10n(context).messageUnknownError,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
      ),
      loading: () => const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
