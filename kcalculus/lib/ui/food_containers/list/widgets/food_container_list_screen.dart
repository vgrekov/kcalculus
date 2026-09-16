import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/food_containers/common/widgets/food_container_list.dart';
import 'package:kcalculus/ui/food_containers/list/view_models/food_container_list_view_model.dart';
import 'package:kcalculus/ui/food_containers/save/widgets/food_container_save_screen.dart';
import 'package:kcalculus/ui/food_containers/search/widgets/food_container_search_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class FoodContainerListScreen extends ConsumerWidget with WidgetMessenger {
  FoodContainerListScreen({super.key});

  late final _assignments = <FoodContainerListCommand, UiAssignment>{
    FoodContainerListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    FoodContainerListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    FoodContainerListCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  void _search(BuildContext context, WidgetRef ref) async {
    final container = await Navigator.of(context).push<FoodContainer>(
      MaterialPageRoute(
        builder: (context) => FoodContainerSearchScreen(),
      ),
    );

    if (container != null && context.mounted) {
      _editFoodContainer(context, container);
    }
  }

  void _addFoodContainer(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FoodContainerSaveScreen(),
      ),
    );
  }

  void _editFoodContainer(BuildContext context, FoodContainer container) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodContainerSaveScreen(
          container: container,
        ),
      ),
    );
  }

  void _deleteFoodContainer(BuildContext context, WidgetRef ref, String id) {
    ProgressOverlay.wrap(
      context,
      ref.read(foodContainerListViewModel.notifier).deleteFoodContainer(id),
    );
  }

  void _restoreFoodContainer(BuildContext context, WidgetRef ref, String id) {
    ProgressOverlay.wrap(
      context,
      ref.read(foodContainerListViewModel.notifier).restoreFoodContainer(id),
    );
  }

  void _showDeletionSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotificationWithUndo(
      context,
      l10n(context).messageFoodContainerDeletionSuccess,
      undoAction: () {
        _restoreFoodContainer(
          context,
          ref,
          command.payload as String,
        );
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
      l10n(context).messageFoodContainerDeletionFailure,
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
    final uiState = ref.watch(foodContainerListViewModel);

    final viewModel = ref.read(foodContainerListViewModel.notifier);

    return UiSubordinate<FoodContainerListCommand>(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n(context).screenFoodContainers,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _search(context, ref);
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: FoodContainerList(
            items: uiState,
            onLoadNextPage: () => ref
                .read(
                  foodContainerListViewModel.notifier,
                )
                .loadNextPage(),
            onRefresh: () => ref
                .read(
                  foodContainerListViewModel.notifier,
                )
                .refresh(),
            onSelectItem: (item) {
              _editFoodContainer(context, item);
            },
            onDeleteItem: (item) {
              _deleteFoodContainer(context, ref, item.id!);
            },
          ),
        ),
        floatingActionButton: Awaited(
          future: uiState,
          data: (_, _) => FloatingActionButton(
            onPressed: () {
              _addFoodContainer(context);
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
