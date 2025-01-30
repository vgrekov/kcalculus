import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/edibles/search/view_models/edible_search_ui_state.dart';
import 'package:kcalculus/ui/edibles/search/view_models/edible_search_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/edible_search_results.dart';
import 'package:kcalculus/widgets/text_input.dart';

final _edibleSearchViewModel = NotifierProvider.autoDispose
    .family<EdibleSearchViewModel, EdibleSearchUiState, String>(
  () => EdibleSearchViewModel(),
);

class EdibleSearchScreen extends ConsumerStatefulWidget {
  const EdibleSearchScreen({
    super.key,
    this.initialQuery = '',
    this.edibleSearchFilter,
  });

  final String initialQuery;

  final bool Function(EdibleSearchResult)? edibleSearchFilter;

  @override
  ConsumerState<EdibleSearchScreen> createState() {
    return _EdibleSearchScreenState();
  }
}

class _EdibleSearchScreenState extends ConsumerState<EdibleSearchScreen>
    with StateMessenger, ProgressiveState {
  final _searchController = TextEditingController();

  late final _assignments = <EdibleSearchCommand, UiAssignment>{
    EdibleSearchCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
    EdibleSearchCommand.exit: _exitWithResult,
  };

  void _updateSearchQuery(String query) {
    ref
        .read(_edibleSearchViewModel(widget.initialQuery).notifier)
        .updateSearchQuery(query);
  }

  void _resetSearchQuery() {
    ref
        .read(_edibleSearchViewModel(widget.initialQuery).notifier)
        .resetSearch();
  }

  void _selectSearchResult(EdibleSearchResult searchResult) async {
    wrapInProgress(
      ref
          .read(_edibleSearchViewModel(widget.initialQuery).notifier)
          .selectEdible(searchResult),
    );
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
    var uiState = ref.watch(_edibleSearchViewModel(widget.initialQuery));

    _searchController.text = uiState.searchQuery;

    var edibles = uiState.searchResults;
    if (widget.edibleSearchFilter != null) {
      edibles = edibles
          .then((data) => data.where(widget.edibleSearchFilter!).toList());
    }

    return UiSubordinate<EdibleSearchCommand>(
      commandProvider: ref
          .read(_edibleSearchViewModel(widget.initialQuery).notifier)
          .commandProvider,
      assignments: _assignments,
      child: FutureBuilder(
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
                      onPressed: _exit,
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
      ),
    );
  }
}
