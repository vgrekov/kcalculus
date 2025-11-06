import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/ui/common/view_models/paginator_view_model.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('FoodContainerListViewModel');

enum FoodContainerListCommand {
  showUnknownErrorNotification,
  showDeletionSuccessNotification,
  showDeletionFailureNotification,
}

class FoodContainerListViewModel
    extends AutoDisposeNotifier<FutureOr<List<FoodContainer>>>
    with PaginatorViewModel<FoodContainer> {
  UiCommander<FoodContainerListCommand>? _commander;

  @override
  Future<List<FoodContainer>> build() {
    ref.watch(foodContainerRepositoryProvider);

    _commander = UiCommander<FoodContainerListCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return loadPage(firstPageConfig());
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  @override
  int get pageSize => 25;

  @override
  FutureOr<List<FoodContainer>> getData() => state;

  @override
  void setData(FutureOr<List<FoodContainer>> data) {
    state = data;
  }

  @override
  Future<List<FoodContainer>> loadPage([
    PageConfig<FoodContainer>? pageConfig,
  ]) {
    final repo = ref.read(foodContainerRepositoryProvider.notifier);

    return repo.getAll(pageConfig: pageConfig);
  }

  Future<void> deleteFoodContainer(String id) async {
    _log.finer('deleteFoodContainer() START');

    try {
      _log.finest('deleteFoodContainer() Deleting food container with ID: $id');

      final repo = ref.read(foodContainerRepositoryProvider.notifier);

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

      final repo = ref.read(foodContainerRepositoryProvider.notifier);

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
    FoodContainerListViewModel, FutureOr<List<FoodContainer>>>(
  () => FoodContainerListViewModel(),
);
