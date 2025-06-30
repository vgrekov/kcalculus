import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/ui/common/view_models/search/search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/search_controller.dart';
import 'package:kcalculus/ui/nutrients/search/view_models/nutrient_search_view_model_arg.dart';
import 'package:kcalculus/ui/providers.dart';

class NutrientSearchViewModel extends AutoDisposeFamilyNotifier<
    SearchUiState<Nutrient>, NutrientSearchViewModelArg> {
  late SearchController searchController;

  late List<Nutrient> initialData;

  @override
  SearchUiState<Nutrient> build(NutrientSearchViewModelArg arg) {
    ref.onDispose(() {
      searchController.dispose();
    });

    searchController = SearchController(_search);

    initialData = Nutrient.values
        .where(
          (n) => !arg.exceptions.contains(n),
        )
        .toList();

    return _doSearch(arg.intialQuery);
  }

  void _search(String query) {
    state = _doSearch(query);
  }

  SearchUiState<Nutrient> _doSearch(String query) {
    final l10n = ref.read(l10nProvider);

    final data = initialData
        .where(
          (n) => n.localName(l10n).toUpperCase().contains(query.toUpperCase()),
        )
        .toList();

    return SearchUiState<Nutrient>(
      searchQuery: query,
      dataLoader: Future.value(data),
      data: data,
    );
  }
}

final nutrientSearchViewModel = NotifierProvider.autoDispose.family<
    NutrientSearchViewModel,
    SearchUiState<Nutrient>,
    NutrientSearchViewModelArg>(
  () => NutrientSearchViewModel(),
);
