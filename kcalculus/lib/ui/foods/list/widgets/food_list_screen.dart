import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/edible_search_results.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/foods/list/view_models/food_list_view_model.dart';
import 'package:kcalculus/ui/foods/save/widgets/food_save_screen.dart';
import 'package:kcalculus/ui/foods/view/widgets/food_view_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';

class FoodListScreen extends ConsumerStatefulWidget {
  const FoodListScreen({super.key});

  @override
  ConsumerState<FoodListScreen> createState() {
    return _FoodListScreenState();
  }
}

class _FoodListScreenState extends ConsumerState<FoodListScreen>
    with StateMessenger, ProgressiveState {
  final _searchController = TextEditingController();

  late final _assignments = <FoodListCommand, UiAssignment>{
    FoodListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    FoodListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    FoodListCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
  };

  void _updateSearchQuery(String query) {
    ref.read(foodListViewModel.notifier).updateSearchQuery(query);
  }

  void _resetSearchQuery() {
    ref.read(foodListViewModel.notifier).resetSearch();
  }

  void _addFood() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FoodSaveScreen(),
      ),
    );
  }

  void _viewFood(EdibleSearchResult searchResult) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodViewScreen(
          foodId: searchResult.id,
          onDeleteFood: (id) {
            _deleteFood(id);
          },
        ),
      ),
    );
  }

  void _deleteFood(String id) {
    wrapInProgress(
      ref.read(foodListViewModel.notifier).deleteFood(id),
    );
  }

  void _restoreFood(String id) {
    wrapInProgress(
      ref.read(foodListViewModel.notifier).restoreFood(id),
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
      l10n(context).messageFoodDeletionSuccess,
      undoAction: () {
        _restoreFood(command.payload as String);
      },
    );
    command.complete();
  }

  void _showDeletionFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageFoodDeletionFailure);
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
    var uiState = ref.watch(foodListViewModel);

    _searchController.text = uiState.searchQuery;

    return UiSubordinate<FoodListCommand>(
      commandProvider: ref.read(foodListViewModel.notifier).commandProvider,
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
                l10n(context).messageFoodSearchNothingFound,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            );
          } else {
            body = EdibleSearchResults(
              searchResults: snapshot.data!,
              onSelectSearchResult: _viewFood,
              confirmDeleteMessage:
                  l10n(context).messageFoodDeletionConfirmation,
              onDeleteEdible: (searchResult) {
                _deleteFood(searchResult.id);
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                l10n(context).screenFoods,
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
                    onPressed: _addFood,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              padding: EdgeInsets.only(top: 32),
              child: const ScreenTabBar(
                selectedTab: ScreenTab.foods,
              ),
            ),
          );
        },
      ),
    );
  }
}
