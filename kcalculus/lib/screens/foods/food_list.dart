import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/foods.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/screens/foods/food_save.dart';
import 'package:kcalculus/screens/foods/food_view.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/edible_search_results.dart';
import 'package:kcalculus/widgets/screen_tab_bar.dart';
import 'package:kcalculus/widgets/text_input.dart';

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

  @override
  void initState() {
    _searchController.text = ref.read(foodSearchQueryProvider).text;
    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref.read(foodSearchQueryProvider.notifier).updateQuery(query);
  }

  void _resetSearchQuery() {
    ref.read(foodSearchQueryProvider.notifier).reset();
    setState(() {
      _searchController.text = '';
    });
  }

  void _addFood() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SaveFoodScreen(),
      ),
    );
  }

  void _viewFood(EdibleSearchResult searchResult) async {
    showProgress();

    try {
      final foodDao = await ref.read(foodDaoProvider);
      Food? food = await foodDao.getById(searchResult.id!);
      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewFoodScreen(
              food: food!,
              onDeleteFood: (id) {
                _deleteFood(id);
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

  void _deleteFood(String id) async {
    showProgress();

    try {
      final isDeleted = await ref.read(foodsProvider.notifier).deleteFood(id);

      if (mounted) {
        if (isDeleted) {
          showNotificationWithUndo(
            l10n(context).messageFoodDeletionSuccess,
            undoAction: () async {
              await ref.read(foodsProvider.notifier).restoreFood(id);
            },
          );
        } else {
          showNotification(l10n(context).messageFoodDeletionFailure);
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
    final foods = ref.watch(foodsProvider);
    return FutureBuilder(
      future: foods,
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
            confirmDeleteMessage: l10n(context).messageFoodDeletionConfirmation,
            onDeleteEdible: (searchResult) {
              _deleteFood(searchResult.id!);
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
    );
  }
}
