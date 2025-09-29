import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/nutrients/search/view_models/nutrient_search_view_model.dart';
import 'package:kcalculus/ui/nutrients/search/view_models/nutrient_search_view_model_arg.dart';
import 'package:kcalculus/ui/nutrients/search/widgets/nutrient_search_list.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutrientSearchScreen extends ConsumerStatefulWidget {
  NutrientSearchScreen({
    super.key,
    String initialQuery = '',
    List<Nutrient> exceptions = const [],
  }) : viewModelArg = NutrientSearchViewModelArg(
          intialQuery: initialQuery,
          exceptions: exceptions,
        );

  final NutrientSearchViewModelArg viewModelArg;

  @override
  ConsumerState<NutrientSearchScreen> createState() {
    return _NutrientSearchScreenState();
  }
}

class _NutrientSearchScreenState extends ConsumerState<NutrientSearchScreen>
    with StateMessenger {
  final _searchController = TextEditingController();

  @override
  void initState() {
    var uiState = ref.read(nutrientSearchViewModel(widget.viewModelArg));

    _searchController.text = uiState.searchQuery;

    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref
        .read(nutrientSearchViewModel(widget.viewModelArg).notifier)
        .searchController
        .updateQuery(query);
  }

  void _resetSearchQuery() {
    ref
        .read(nutrientSearchViewModel(widget.viewModelArg).notifier)
        .searchController
        .reset();
  }

  void _selectNutrient(Nutrient nutrient) async {
    Navigator.of(context).pop(nutrient);
  }

  void _exit() {
    Navigator.of(context).pop<Nutrient>(null);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(nutrientSearchViewModel(widget.viewModelArg));

    ref.listen(nutrientSearchViewModel(widget.viewModelArg), (prev, next) {
      _searchController.text = next.searchQuery;
    });

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
              hintText: l10n(context).hintNutrientSearchBox,
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
      body: SafeArea(
        child: NutrientSearchList(
          items: uiState.data,
          onSelectItem: _selectNutrient,
        ),
      ),
    );
  }
}
