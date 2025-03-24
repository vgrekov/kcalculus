import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/edible_search/edible_search_helper.dart';
import 'package:kcalculus/ui/common/view_models/edible_search/edible_search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FoodListViewModel');

enum FoodListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class FoodListViewModel extends Notifier<EdibleSearchUiState> {
  static const _kPageSize = 10;

  UiCommander<FoodListCommand>? _commander;

  late final EdibleSearchHelper searchHelper = EdibleSearchHelper(
    searchResultType: EdibleSearchResultType.food,
    pageSize: _kPageSize,
    getRef: () => ref,
    getState: () => state,
    setState: (value) => state = value,
  );

  @override
  EdibleSearchUiState build() {
    ref.watch(foodChangesProvider);

    _commander = UiCommander<FoodListCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    String query = stateOrNull?.searchQuery ?? '';

    return searchHelper.initState(query);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> deleteFood(String id) async {
    _log.finer('deleteFood() START');

    try {
      _log.finest('deleteFood() Deleting food with ID: $id');

      final deleted = await ref.read(foodRepositoryProvider).delete(id);

      _log.info('Food deleted: $deleted');
      _log.eventFoodDelete();

      if (deleted) {
        _commander!.send<String, void>(
          FoodListCommand.showDeletionSuccessNotification,
          payload: id,
        );
      } else {
        _commander!.send(FoodListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to delete food', error, stackTrace);

      _commander!.send(FoodListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteFood() END');
  }

  Future<void> restoreFood(String id) async {
    _log.finer('restoreFood() START');

    try {
      _log.finest('restoreFood() Restoring food with ID: $id');

      final restored = await ref.read(foodRepositoryProvider).restore(id);

      _log.info('Food restored: $restored');
      _log.eventFoodRestore();
    } catch (error, stackTrace) {
      _log.severe('Failed to restore food', error, stackTrace);

      _commander!.send(FoodListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreFood() END');
  }
}

final foodListViewModel =
    NotifierProvider<FoodListViewModel, EdibleSearchUiState>(
  () => FoodListViewModel(),
);
