import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/food_search.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/edible_search_results.dart';
import 'package:kcalculus/widgets/screen_tab_bar.dart';

class FoodsScreen extends ConsumerStatefulWidget {
  const FoodsScreen({super.key});

  @override
  ConsumerState<FoodsScreen> createState() {
    return _FoodsScreenState();
  }
}

class _FoodsScreenState extends ConsumerState<FoodsScreen>
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

  void _selectSearchResult(EdibleSearchResult searchResult) async {
    showProgress();

    try {
      final foodDao = await ref.read(foodDaoProvider);
      Food? food = await foodDao.getById(searchResult.id!);

      // TODO: Navigate to edit food screen
    } catch (error) {
      showNotification(error.toString());
    } finally {
      hideProgress();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final foods = ref.watch(foodSearchProvider);
    return FutureBuilder(
      future: foods,
      builder: (context, snapshot) {
        final Widget? body;
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
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
            onSelectSearchResult: _selectSearchResult,
          );
        }

        return Scaffold(
          appBar: AppBar(
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
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: l10n(context).hintEdibleSearchBox,
                    isDense: true,
                    suffixIcon: IconButton(
                        onPressed: _resetSearchQuery,
                        icon: const Icon(
                          Icons.clear,
                        )),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textCapitalization: TextCapitalization.words,
                  onChanged: _updateSearchQuery,
                ),
              ),
            ),
          ),
          body: body,
          bottomNavigationBar: const ScreenTabBar(
            selectedTab: ScreenTab.foods,
          ),
        );
      },
    );
  }
}
