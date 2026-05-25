import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/edibles/common/edible_previews/widgets/edible_previews.dart';
import 'package:kcalculus/ui/edibles/search/view_models/edible_search_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';

class EdibleSearchScreen<E> extends ConsumerStatefulWidget {
  static EdibleSearchScreen<Edible> full({
    Key? key,
    String? initialQuery,
  }) =>
      EdibleSearchScreen<Edible>._(
        key: key,
        initialQuery: initialQuery ?? '',
      );

  static EdibleSearchScreen<EdiblePreview> preview({
    Key? key,
    String? initialQuery,
  }) =>
      EdibleSearchScreen<EdiblePreview>._(
        key: key,
        initialQuery: initialQuery ?? '',
      );

  const EdibleSearchScreen._({
    super.key,
    this.initialQuery = '',
  });

  final String initialQuery;

  @override
  ConsumerState<EdibleSearchScreen> createState() {
    return _EdibleSearchScreenState<E>();
  }
}

class _EdibleSearchScreenState<E> extends ConsumerState<EdibleSearchScreen>
    with StateMessenger {
  final _searchController = TextEditingController();

  late final _assignments = <EdibleSearchCommand, UiAssignment>{
    EdibleSearchCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
    EdibleSearchCommand.exit: _exitWithResult,
  };

  @override
  void initState() {
    var uiState = ref.read(edibleSearchViewModel(widget.initialQuery));

    _searchController.text = uiState.query;

    super.initState();
  }

  void _updateSearchQuery(String query) {
    ref
        .read(edibleSearchViewModel(widget.initialQuery).notifier)
        .searchController
        .updateQuery(query);
  }

  void _resetSearchQuery() {
    ref
        .read(edibleSearchViewModel(widget.initialQuery).notifier)
        .searchController
        .reset();
  }

  void _selectPreview(EdiblePreview preview) async {
    if (E == EdiblePreview) {
      Navigator.of(context).pop<EdiblePreview>(preview);
    } else {
      ProgressOverlay.wrap(
        context,
        ref
            .read(edibleSearchViewModel(widget.initialQuery).notifier)
            .selectEdible(preview),
      );
    }
  }

  void _exit() {
    Navigator.of(context).pop<Edible>(null);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  void _exitWithResult(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    Navigator.of(context).pop<Edible>(command.payload as Edible?);
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(edibleSearchViewModel(widget.initialQuery));

    ref.listen(edibleSearchViewModel(widget.initialQuery), (prev, next) {
      _searchController.text = next.query;
    });

    final viewModel =
        ref.read(edibleSearchViewModel(widget.initialQuery).notifier);

    return UiSubordinate<EdibleSearchCommand>(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Scaffold(
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
        body: EdiblePreviews(
          items: uiState.data,
          onLoadNextPage: () => ref
              .read(
                edibleSearchViewModel(widget.initialQuery).notifier,
              )
              .loadNextPage(),
          onRefresh: () => ref
              .read(
                edibleSearchViewModel(widget.initialQuery).notifier,
              )
              .refresh(),
          onSelectItem: _selectPreview,
          noItemsMessage: l10n(context).messageEdibleSearchNothingFound,
        ),
      ),
    );
  }
}
