import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/food_containers/common/widgets/food_container_list.dart';
import 'package:kcalculus/ui/food_containers/search/view_models/food_container_search_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';

class FoodContainerSearchScreen extends ConsumerStatefulWidget {
  const FoodContainerSearchScreen({
    super.key,
    this.initialQuery = '',
  });

  final String initialQuery;

  @override
  ConsumerState<FoodContainerSearchScreen> createState() {
    return _FoodContainerSearchScreenState();
  }
}

class _FoodContainerSearchScreenState
    extends ConsumerState<FoodContainerSearchScreen> with StateMessenger {
  final _searchController = TextEditingController();

  @override
  void initState() {
    var uiState = ref.read(foodContainerSearchViewModel(widget.initialQuery));

    _searchController.text = uiState.searchQuery;

    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref
        .read(foodContainerSearchViewModel(widget.initialQuery).notifier)
        .searchHelper
        .searchController
        .updateQuery(query);
  }

  void _resetSearchQuery() {
    ref
        .read(foodContainerSearchViewModel(widget.initialQuery).notifier)
        .searchHelper
        .searchController
        .reset();
  }

  void _selectContainer(FoodContainer container) async {
    Navigator.of(context).pop(container);
  }

  void _exit() {
    Navigator.of(context).pop<FoodContainer>(null);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiState =
        ref.watch(foodContainerSearchViewModel(widget.initialQuery));

    ref.listen(foodContainerSearchViewModel(widget.initialQuery), (prev, next) {
      _searchController.text = next.searchQuery;
    });

    final viewModel =
        ref.read(foodContainerSearchViewModel(widget.initialQuery).notifier);

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
              hintText: l10n(context).hintFoodContainerSearchBox,
              prefix: IconButton(
                onPressed: _exit,
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
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
      body: FoodContainerList(
        items: uiState.data,
        itemsLoader: uiState.dataLoader,
        paginator: viewModel.searchHelper.paginator,
        onSelectItem: _selectContainer,
      ),
    );
  }
}
