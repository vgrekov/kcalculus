import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/data/usda/usda.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/domain/edible/use_cases/edible_use_case.dart';
import 'package:kcalculus/ui/common/view_models/paginator_view_model.dart';
import 'package:kcalculus/ui/common/view_models/search_view_model.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/ui/edibles/search/view_models/edible_search_ui_state.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('EdibleSearchViewModel');

enum EdibleSearchCommand {
  showUnknownErrorNotification,
  exit,
}

class EdibleSearchViewModel
    extends AutoDisposeFamilyNotifier<EdibleSearchUiState, String>
    with PaginatorViewModel<EdiblePreview>, SearchViewModel<EdiblePreview> {
  UiCommander<EdibleSearchCommand>? _commander;

  @override
  EdibleSearchUiState build(String arg) {
    _commander = UiCommander<EdibleSearchCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
      searchController.dispose();
    });

    return EdibleSearchUiState(
      query: arg,
      data: search(
        arg,
        pageConfig: firstPageConfig(),
      ),
    );
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  @override
  int get pageSize => 25;

  @override
  String getQuery() => state.query;

  @override
  FutureOr<List<EdiblePreview>> getData() => state.data;

  @override
  void updateState({
    String? query,
    FutureOr<List<EdiblePreview>>? data,
  }) {
    state = state.copyWith(
      query: query ?? state.query,
      data: data ?? state.data,
    );
  }

  @override
  Future<List<EdiblePreview>> search(
    String query, {
    PageConfig<EdiblePreview>? pageConfig,
  }) {
    final edibleUseCase = ref.read(edibleUseCaseProvider.notifier);

    return edibleUseCase.search(query, pageConfig: pageConfig);
  }

  Future<void> selectEdible(EdiblePreview preview) async {
    _log.finer('selectEdible() START');

    try {
      _log.finest(
        'selectEdible() Loading edible from search result: ${preview.toJson()}',
      );

      Edible? edible;
      switch (preview.type) {
        case EdiblePreviewType.dish:
          _log.finer('selectEdible() Loading dish');

          final dishRepository = ref.read(dishRepositoryProvider.notifier);
          edible = await dishRepository.getById(preview.id);
          break;
        case EdiblePreviewType.food:
          _log.finer('selectEdible() Loading food');

          final foodRepository = ref.read(foodRepositoryProvider.notifier);
          edible = await foodRepository.getById(preview.id);
          break;
        case EdiblePreviewType.usda:
          _log.finer('selectEdible() Loading USDA food');

          final usdaFoodRepository =
              ref.read(usdaFoodRepositoryProvider.notifier);
          edible = await usdaFoodRepository.getById(preview.id);
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
    .family<EdibleSearchViewModel, EdibleSearchUiState, String>(
  () => EdibleSearchViewModel(),
);
