import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/data/dishes.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/screens/dishes/dish_view.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/dishes/list/view_models/dish_list_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/edible_search_results.dart';
import 'package:kcalculus/widgets/screen_tab_bar.dart';
import 'package:kcalculus/widgets/text_input.dart';

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
    _searchController.text = ref.read(dishSearchQueryProvider).text;
    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref.read(dishListViewModel.notifier).updateSearchQuery(query);
  }

  void _resetSearchQuery() {
    ref.read(dishListViewModel.notifier).resetSearch();
  }

  void _addDish() {
    ref.read(dishWizardProvider.notifier).reset();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DishWizardScreen(),
      ),
    );
  }

  void _viewDish(EdibleSearchResult searchResult) async {
    showProgress();

    try {
      final dishDao = await ref.read(dishDaoProvider);
      Dish? dish = await dishDao.getById(searchResult.id);
      if (dish != null && mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewDishScreen(
              dish: dish,
              onDeleteDish: (id) {
                _deleteDish(id);
              },
            ),
          ),
        );
      }
    } catch (error) {
      showNotification(error.toString());
    } finally {
      hideProgress();
    }
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
    var uiState = ref.watch(dishListViewModel);

    _searchController.text = uiState.searchQuery;

    return UiSubordinate(
      commandProvider: ref.read(dishListViewModel.notifier).commandProvider,
      assignments: _assignments,
      child: FutureBuilder(
        future: uiState.searchResults,
        builder: (context, snapshot) {
          final Widget? body;
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          final readonly = isLoading || snapshot.hasError;
          if (isLoading) {
            body = const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            body = Center(
              child: Text(
                l10n(context).messageUnknownError,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            body = Center(
              child: Text(
                l10n(context).messageDishSearchNothingFound,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            );
          } else {
            body = EdibleSearchResults(
              searchResults: snapshot.data!,
              onSelectSearchResult: _viewDish,
              confirmDeleteMessage:
                  l10n(context).messageDishDeletionConfirmation,
              onDeleteEdible: (searchResult) {
                _deleteDish(searchResult.id);
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                l10n(context).screenDishes,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                        icon: const Icon(
                          Icons.clear,
                        )),
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.search,
                    onChanged: _updateSearchQuery,
                  ),
                ),
              ),
            ),
            body: body,
            floatingActionButton: readonly
                ? null
                : FloatingActionButton(
                    onPressed: _addDish,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              padding: EdgeInsets.only(top: 32),
              child: const ScreenTabBar(
                selectedTab: ScreenTab.dishes,
              ),
            ),
          );
        },
      ),
    );
  }
}
