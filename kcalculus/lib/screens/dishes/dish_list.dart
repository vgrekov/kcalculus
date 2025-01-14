import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/data/dishes.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/screens/dishes/dish_view.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
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

  @override
  void initState() {
    _searchController.text = ref.read(dishSearchQueryProvider).text;
    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref.read(dishSearchQueryProvider.notifier).updateQuery(query);
  }

  void _resetSearchQuery() {
    ref.read(dishSearchQueryProvider.notifier).reset();
    setState(() {
      _searchController.text = '';
    });
  }

  void _addDish() async {
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
      Dish? dish = await dishDao.getById(searchResult.id!);
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

  void _deleteDish(String id) async {
    showProgress();

    try {
      final isDeleted = await ref.read(dishesProvider.notifier).deleteDish(id);

      if (mounted) {
        if (isDeleted) {
          showNotificationWithUndo(
            l10n(context).messageDishDeletionSuccess,
            undoAction: () async {
              await ref.read(dishesProvider.notifier).restoreDish(id);
            },
          );
        } else {
          showNotification(l10n(context).messageDishDeletionFailure);
        }
      }
    } catch (error) {
      showNotification(error.toString());
    }

    hideProgress();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dishes = ref.watch(dishesProvider);
    return FutureBuilder(
      future: dishes,
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
            confirmDeleteMessage: l10n(context).messageDishDeletionConfirmation,
            onDeleteEdible: (searchResult) {
              _deleteDish(searchResult.id!);
            },
          );
        }

        return Scaffold(
          appBar: AppBar(
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
    );
  }
}
