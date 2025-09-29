import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/food_container_repository.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/ui/common/view_models/search/search_helper.dart';
import 'package:kcalculus/ui/common/view_models/search/search_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/food_containers/common/view_models/food_container_search_helper.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FoodContainerListViewModel');

enum FoodContainerListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class FoodContainerListViewModel
    extends AutoDisposeNotifier<SearchUiState<FoodContainer>> {
  static const _kPageSize = 25;

  UiCommander<FoodContainerListCommand>? _commander;

  late final SearchHelper<FoodContainer> searchHelper =
      FoodContainerSearchHelper(
    pageSize: _kPageSize,
    getRef: () => ref,
    getState: () => state,
    setState: (value) => state = value,
  );

  @override
  SearchUiState<FoodContainer> build() {
    ref.watch(foodContainerChangesProvider);

    _commander = UiCommander<FoodContainerListCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    String query = stateOrNull?.searchQuery ?? '';

    return searchHelper.initState(query);
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  Future<void> deleteFoodContainer(String id) async {
    _log.finer('deleteFoodContainer() START');

    try {
      _log.finest('deleteFoodContainer() Deleting food container with ID: $id');

      final repo = await ref.read(foodContainerRepositoryProvider.future);

      final deleted = await repo.delete(id);

      _log.info('Food container deleted: $deleted');
      _log.eventFoodContainerDelete();

      if (deleted) {
        _commander!.send<String, void>(
          FoodContainerListCommand.showDeletionSuccessNotification,
          payload: id,
        );
      } else {
        _commander!
            .send(FoodContainerListCommand.showDeletionFailureNotification);
      }
    } catch (error, stackTrace) {
      _log.severe('Failed to delete food container', error, stackTrace);

      _commander!.send(FoodContainerListCommand.showUnknownErrorNotification);
    }

    _log.finer('deleteFoodContainer() END');
  }

  Future<void> restoreFoodContainer(String id) async {
    _log.finer('restoreFoodContainer() START');

    try {
      _log.finest('restoreFoodContainer() Restoring food with ID: $id');

      final repo = await ref.read(foodContainerRepositoryProvider.future);

      final restored = await repo.restore(id);

      _log.info('Food container restored: $restored');
      _log.eventFoodContainerRestore();
    } catch (error, stackTrace) {
      _log.severe('Failed to restore food container', error, stackTrace);

      _commander!.send(FoodContainerListCommand.showUnknownErrorNotification);
    }

    _log.finer('restoreFoodContainer() END');
  }
}

final foodContainerListViewModel = NotifierProvider.autoDispose<
    FoodContainerListViewModel, SearchUiState<FoodContainer>>(
  () => FoodContainerListViewModel(),
);
