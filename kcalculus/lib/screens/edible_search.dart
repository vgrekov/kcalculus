import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/edible_search.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/edible_search_results.dart';
import 'package:kcalculus/widgets/text_input.dart';

class EdibleSearchScreen extends ConsumerStatefulWidget {
  final void Function(Edible) onSelectEdible;

  const EdibleSearchScreen({
    super.key,
    required this.onSelectEdible,
  });

  @override
  ConsumerState<EdibleSearchScreen> createState() {
    return _EdibleSearchScreenState();
  }
}

class _EdibleSearchScreenState extends ConsumerState<EdibleSearchScreen>
    with StateMessenger, ProgressiveState {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.text = ref.read(edibleSearchQueryProvider).text;
    super.initState();
  }

  void _goBack() {
    Navigator.of(context).pop();
  }

  void _updateSearchQuery(String query) {
    ref.read(edibleSearchQueryProvider.notifier).updateQuery(query);
  }

  void _resetSearchQuery() {
    ref.read(edibleSearchQueryProvider.notifier).reset();
    setState(() {
      _searchController.text = '';
    });
  }

  void _selectSearchResult(EdibleSearchResult searchResult) async {
    showProgress();

    try {
      Edible? edible;
      if (searchResult.id != null) {
        switch (searchResult.type) {
          case EdibleSearchResultType.dish:
            break;
          default:
            final foodDao = await ref.read(foodDaoProvider);
            edible = await foodDao.getById(searchResult.id!);
        }
      }

      if (edible != null) {
        widget.onSelectEdible(edible);
      }

      _goBack();
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
    final edibles = ref.watch(edibleSearchProvider);
    return FutureBuilder(
      future: edibles,
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
              l10n(context).messageEdibleSearchNothingFound,
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
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Hero(
              tag: 'search-box',
              child: Material(
                type: MaterialType.transparency,
                child: TextInput(
                  controller: _searchController,
                  autofocus: true,
                  hintText: l10n(context).hintEdibleSearchBox,
                  prefix: IconButton(
                    onPressed: _goBack,
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: _resetSearchQuery,
                    icon: const Icon(
                      Icons.clear,
                    ),
                  ),
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.search,
                  onChanged: _updateSearchQuery,
                ),
              ),
            ),
          ),
          body: body,
        );
      },
    );
  }
}
