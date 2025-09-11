import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/access_guard/utils/premium_feature.dart';
import 'package:kcalculus/ui/access_guard/widgets/access_guard.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/ui/common/widgets/premium_badge.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/dishes/view/widgets/dish_view_screen.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/ui/edibles/common/edible_search_results/widgets/edible_search_results.dart';
import 'package:kcalculus/ui/edibles/list/view_models/edible_list_view_model.dart';
import 'package:kcalculus/ui/foods/save/widgets/food_save_screen.dart';
import 'package:kcalculus/ui/foods/scan/widgets/food_scan_screen.dart';
import 'package:kcalculus/ui/foods/view/widgets/food_view_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('EdibleListScreen');

class EdibleListScreen extends ConsumerStatefulWidget {
  const EdibleListScreen({super.key});

  @override
  ConsumerState<EdibleListScreen> createState() {
    return _EdibleListScreenState();
  }
}

class _EdibleListScreenState extends ConsumerState<EdibleListScreen>
    with StateMessenger {
  final _searchController = TextEditingController();

  late final _assignments = <EdibleListCommand, UiAssignment>{
    EdibleListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    EdibleListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    EdibleListCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  final _accessGuardKey = UniqueKey();

  @override
  void initState() {
    var uiState = ref.read(edibleListViewModel);

    _searchController.text = uiState.searchQuery;

    super.initState();
  }

  void _scanFood() async {
    final scannerDisclaimerEnabled = await ref
        .read(edibleListViewModel.notifier)
        .isScannerDisclaimerEnabled();

    if (scannerDisclaimerEnabled) {
      _showScannerDisclaimer();
    } else {
      _doScanFood();
    }
  }

  void _showScannerDisclaimer() {
    showMessageDialog(
      message: l10n(context).messageScannerDisclaimer,
      actions: {
        l10n(context).actionOk: () => _doScanFood(),
        l10n(context).actionDontShowAgain: () {
          ref.read(edibleListViewModel.notifier).disableScannerDisclaimer();
          _doScanFood();
        }
      },
      messageType: MessageType.warning,
    );
  }

  void _doScanFood() async {
    premiumFeature(ref, _accessGuardKey, () async {
      _log.eventFoodScan();

      final food = await showModalBottomSheet<Food>(
        context: context,
        scrollControlDisabledMaxHeightRatio: 0.9,
        builder: (context) => const FoodScanScreen(),
      );

      if (food != null) {
        _addFood(food);
      }
    });
  }

  void _updateSearchQuery(String query) {
    ref
        .read(edibleListViewModel.notifier)
        .searchHelper
        .searchController
        .updateQuery(query);
  }

  void _resetSearchQuery() {
    ref
        .read(edibleListViewModel.notifier)
        .searchHelper
        .searchController
        .reset();
  }

  void _addFood([Food? food]) async {
    final nutrientDefaults =
        await ref.read(edibleListViewModel.notifier).getNutrientDefaults();

    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FoodSaveScreen(
            food: food,
            nutrientDefaults: nutrientDefaults,
          ),
        ),
      );
    }
  }

  void _addDish() async {
    final nutrientDefaults =
        await ref.read(edibleListViewModel.notifier).getNutrientDefaults();

    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DishWizardScreen(
            nutrientDefaults: nutrientDefaults,
          ),
        ),
      );
    }
  }

  void _viewEdible(EdibleSearchResult searchResult) {
    switch (searchResult.type) {
      case EdibleSearchResultType.food:
        _viewFood(searchResult);

        break;
      case EdibleSearchResultType.dish:
        _viewDish(searchResult);

        break;
      default:
        break;
    }
  }

  void _viewFood(EdibleSearchResult searchResult) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodViewScreen(
          foodId: searchResult.id,
          onDeleteFood: (_) {
            _deleteEdible(searchResult);
          },
        ),
      ),
    );
  }

  void _viewDish(EdibleSearchResult searchResult) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DishViewScreen(
          dishId: searchResult.id,
          onDeleteDish: (_) {
            _deleteEdible(searchResult);
          },
        ),
      ),
    );
  }

  void _deleteEdible(EdibleSearchResult searchResult) {
    ProgressOverlay.wrap(
      context,
      ref.read(edibleListViewModel.notifier).deleteEdible(searchResult),
    );
  }

  void _restoreEdible(EdibleSearchResult searchResult) {
    ProgressOverlay.wrap(
      context,
      ref.read(edibleListViewModel.notifier).restoreEdible(searchResult),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showDeletionSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotificationWithUndo(
      l10n(context).messageFoodDeletionSuccess,
      undoAction: () {
        _restoreEdible(command.payload as EdibleSearchResult);
      },
    );
    command.complete();
  }

  void _showDeletionFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageFoodDeletionFailure);
    command.complete();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(edibleListViewModel);

    ref.listen(edibleListViewModel, (prev, next) {
      _searchController.text = next.searchQuery;
    });

    final viewModel = ref.read(edibleListViewModel.notifier);

    return AccessGuard(
      key: _accessGuardKey,
      child: UiSubordinate<EdibleListCommand>(
        commandProvider: viewModel.commandProvider,
        assignments: _assignments,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              l10n(context).screenFoods,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextInput(
                  controller: _searchController,
                  prefix: IconButton(
                    onPressed: _scanFood,
                    icon: PremiumBadge(
                      child: Icon(
                        Icons.qr_code_scanner,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  hintText: l10n(context).hintEdibleSearchBox,
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
          body: EdibleSearchResults(
            items: uiState.data,
            itemsLoader: uiState.dataLoader,
            paginator: viewModel.searchHelper.paginator,
            onSelectItem: _viewEdible,
            onDeleteItem: _deleteEdible,
            noItemsMessage: l10n(context).messageFoodSearchNothingFound,
            confirmDeleteMessage: (searchResult) => switch (searchResult.type) {
              EdibleSearchResultType.food =>
                l10n(context).messageFoodDeletionConfirmation,
              EdibleSearchResultType.dish =>
                l10n(context).messageDishDeletionConfirmation,
              _ => null,
            },
          ),
          floatingActionButton: Awaited(
            future: uiState.dataLoader,
            data: (_, __) => FloatingActionButton(
              onPressed: _addFood,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            color: Theme.of(context).colorScheme.surfaceContainer,
            padding: EdgeInsets.only(top: 32),
            child: const ScreenTabBar(
              selectedTab: ScreenTab.edibles,
            ),
          ),
        ),
      ),
    );
  }
}
