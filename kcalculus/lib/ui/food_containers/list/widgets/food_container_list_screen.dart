import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/access_guard/widgets/access_guard.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/food_containers/common/widgets/food_container_list.dart';
import 'package:kcalculus/ui/food_containers/list/view_models/food_container_list_view_model.dart';
import 'package:kcalculus/ui/food_containers/save/widgets/food_container_save_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class FoodContainerListScreen extends ConsumerStatefulWidget {
  const FoodContainerListScreen({super.key});

  @override
  ConsumerState<FoodContainerListScreen> createState() {
    return _FoodContainerListScreenState();
  }
}

class _FoodContainerListScreenState
    extends ConsumerState<FoodContainerListScreen> with StateMessenger {
  final _searchController = TextEditingController();

  late final _assignments = <FoodContainerListCommand, UiAssignment>{
    FoodContainerListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    FoodContainerListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    FoodContainerListCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  final _accessGuardKey = UniqueKey();

  @override
  void initState() {
    var uiState = ref.read(foodContainerListViewModel);

    _searchController.text = uiState.searchQuery;

    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref
        .read(foodContainerListViewModel.notifier)
        .searchHelper
        .searchController
        .updateQuery(query);
  }

  void _resetSearchQuery() {
    ref
        .read(foodContainerListViewModel.notifier)
        .searchHelper
        .searchController
        .reset();
  }

  void _addFoodContainer([FoodContainer? container]) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodContainerSaveScreen(
          container: container,
        ),
      ),
    );
  }

  void _editFoodContainer(FoodContainer container) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodContainerSaveScreen(
          container: container,
        ),
      ),
    );
  }

  void _deleteFoodContainer(String id) {
    ProgressOverlay.wrap(
      context,
      ref.read(foodContainerListViewModel.notifier).deleteFoodContainer(id),
    );
  }

  void _restoreFoodContainer(String id) {
    ProgressOverlay.wrap(
      context,
      ref.read(foodContainerListViewModel.notifier).restoreFoodContainer(id),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showDeletionSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotificationWithUndo(
      l10n(context).messageFoodContainerDeletionSuccess,
      undoAction: () {
        _restoreFoodContainer(command.payload as String);
      },
    );
    command.complete();
  }

  void _showDeletionFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageFoodContainerDeletionFailure);
    command.complete();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(foodContainerListViewModel);

    ref.listen(foodContainerListViewModel, (prev, next) {
      _searchController.text = next.searchQuery;
    });

    final viewModel = ref.read(foodContainerListViewModel.notifier);

    return AccessGuard(
      key: _accessGuardKey,
      child: UiSubordinate<FoodContainerListCommand>(
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextInput(
                  controller: _searchController,
                  hintText: l10n(context).hintFoodContainerSearchBox,
                  suffix: IconButton(
                    onPressed: _resetSearchQuery,
                    icon: Icon(
                      Icons.clear,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.search,
                  onChanged: _updateSearchQuery,
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: FoodContainerList(
              items: uiState.data,
              itemsLoader: uiState.dataLoader,
              paginator: viewModel.searchHelper.paginator,
              onSelectItem: _editFoodContainer,
              onDeleteItem: (item) {
                _deleteFoodContainer(item.id!);
              },
            ),
          ),
          floatingActionButton: Awaited(
            future: uiState.dataLoader,
            data: (_, __) => FloatingActionButton(
              onPressed: _addFoodContainer,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
