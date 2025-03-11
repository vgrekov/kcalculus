import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/ui/common/widgets/edible_search_results.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/dishes/list/view_models/dish_list_view_model.dart';
import 'package:kcalculus/ui/dishes/view/widgets/dish_view_screen.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/progressive.dart';

class DishListScreen extends ConsumerStatefulWidget {
  const DishListScreen({super.key});

  @override
  ConsumerState<DishListScreen> createState() {
    return _DishListScreenState();
  }
}

class _DishListScreenState extends ConsumerState<DishListScreen>
    with StateMessenger, ProgressiveState {
  final _searchController = TextEditingController();

  late final _assignments = <DishListCommand, UiAssignment>{
    DishListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    DishListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    DishListCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
  };

  @override
  void initState() {
    var uiState = ref.read(dishListViewModel);

    _searchController.text = uiState.searchQuery;

    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref
        .read(dishListViewModel.notifier)
        .searchHelper
        .searchController
        .updateQuery(query);
  }

  void _resetSearchQuery() {
    ref.read(dishListViewModel.notifier).searchHelper.searchController.reset();
  }

  void _addDish() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DishWizardScreen(),
      ),
    );
  }

  void _viewDish(EdibleSearchResult searchResult) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DishViewScreen(
          dishId: searchResult.id,
          onDeleteDish: (id) {
            _deleteDish(id);
          },
        ),
      ),
    );
  }

  void _deleteDish(String id) {
    wrapInProgress(
      ref.read(dishListViewModel.notifier).deleteDish(id),
    );
  }

  void _restoreDish(String id) {
    wrapInProgress(
      ref.read(dishListViewModel.notifier).restoreDish(id),
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
      l10n(context).messageDishDeletionSuccess,
      undoAction: () {
        _restoreDish(command.payload as String);
      },
    );
    command.complete();
  }

  void _showDeletionFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageDishDeletionFailure);
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
    final uiState = ref.watch(dishListViewModel);

    ref.listen(dishListViewModel, (prev, next) {
      _searchController.text = next.searchQuery;
    });

    final viewModel = ref.read(dishListViewModel.notifier);

    return UiSubordinate(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n(context).screenDishes,
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
                hintText: l10n(context).hintEdibleSearchBox,
                suffix: IconButton(
                    onPressed: _resetSearchQuery,
                    icon: Icon(
                      Icons.clear,
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.search,
                onChanged: _updateSearchQuery,
              ),
            ),
          ),
        ),
        body: EdibleSearchResults(
          items: uiState.data,
          itemsLoader: uiState.dataLoader,
          paginator: viewModel.searchHelper.paginator,
          onSelectItem: _viewDish,
          onDeleteItem: (searchResult) {
            _deleteDish(searchResult.id);
          },
          noItemsMessage: l10n(context).messageDishSearchNothingFound,
          confirmDeleteMessage: l10n(context).messageDishDeletionConfirmation,
        ),
        floatingActionButton: Awaited(
          future: uiState.dataLoader,
          data: (_, __) => FloatingActionButton(
            onPressed: _addDish,
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          padding: EdgeInsets.only(top: 32),
          child: const ScreenTabBar(
            selectedTab: ScreenTab.dishes,
          ),
        ),
      ),
    );
  }
}
