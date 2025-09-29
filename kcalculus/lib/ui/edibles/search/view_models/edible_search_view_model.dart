import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/dish_repository.dart';
import 'package:kcalculus/data/storage/_common/repositories/food_repository.dart';
import 'package:kcalculus/data/usda/_common/repositories/usda_food_repository.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/edible_search_helper.dart';
import 'package:kcalculus/ui/common/view_models/search/search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('EdibleSearchViewModel');

enum EdibleSearchCommand {
  showUnknownErrorNotification,
  exit,
}

class EdibleSearchViewModel extends AutoDisposeFamilyNotifier<
    SearchUiState<EdibleSearchResult>, String> {
  static const _kPageSize = 25;

  UiCommander<EdibleSearchCommand>? _commander;

  late final EdibleSearchHelper searchHelper = EdibleSearchHelper(
    pageSize: _kPageSize,
    getRef: () => ref,
    getState: () => state,
    setState: (value) => state = value,
  );

  @override
  SearchUiState<EdibleSearchResult> build(String arg) {
    _commander = UiCommander<EdibleSearchCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return searchHelper.initState(arg);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> selectEdible(EdibleSearchResult searchResult) async {
    _log.finer('selectEdible() START');

    try {
      _log.finest(
        'selectEdible() Loading edible from search result: ${searchResult.toJson()}',
      );

      Edible? edible;
      switch (searchResult.type) {
        case EdibleSearchResultType.dish:
          _log.finer('selectEdible() Loading dish');

          final dishRepository = ref.read(dishRepositoryProvider.notifier);
          edible = await dishRepository.getById(searchResult.id);
          break;
        case EdibleSearchResultType.food:
          _log.finer('selectEdible() Loading food');

          final foodRepository = ref.read(foodRepositoryProvider.notifier);
          edible = await foodRepository.getById(searchResult.id);
          break;
        case EdibleSearchResultType.usda:
          _log.finer('selectEdible() Loading USDA food');

          final usdaFoodRepository =
              ref.read(usdaFoodRepositoryProvider.notifier);
          edible = await usdaFoodRepository.getById(searchResult.id);
          break;
      }

      if (edible != null) {
        _log.finest('selectEdible() Loaded edible: ${edible.toJson()}');

        _commander!.send<Edible, void>(
          EdibleSearchCommand.exit,
          payload: edible,
        );
      } else {
        _log.fine('selectEdible() Could not load edible');

        _commander!.send(EdibleSearchCommand.exit);
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to load edible from search result',
        error,
        stackTrace,
      );

      _commander!.send(EdibleSearchCommand.showUnknownErrorNotification);
    }

    _log.finer('selectEdible() END');
  }
}

final edibleSearchViewModel = NotifierProvider.autoDispose
    .family<EdibleSearchViewModel, SearchUiState<EdibleSearchResult>, String>(
  () => EdibleSearchViewModel(),
);
