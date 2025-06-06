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
import 'package:kcalculus/ui/common/widgets/edible_search_results.dart';
import 'package:kcalculus/ui/common/widgets/premium_badge.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/foods/list/view_models/food_list_view_model.dart';
import 'package:kcalculus/ui/foods/save/widgets/food_save_screen.dart';
import 'package:kcalculus/ui/foods/scan/widgets/food_scan_screen.dart';
import 'package:kcalculus/ui/foods/view/widgets/food_view_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('FoodListScreen');

class FoodListScreen extends ConsumerStatefulWidget {
  const FoodListScreen({super.key});

  @override
  ConsumerState<FoodListScreen> createState() {
    return _FoodListScreenState();
  }
}

class _FoodListScreenState extends ConsumerState<FoodListScreen>
    with StateMessenger {
  final _searchController = TextEditingController();

  late final _assignments = <FoodListCommand, UiAssignment>{
    FoodListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    FoodListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    FoodListCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
  };

  final _accessGuardKey = UniqueKey();

  @override
  void initState() {
    var uiState = ref.read(foodListViewModel);

    _searchController.text = uiState.searchQuery;

    super.initState();
  }

  void _scanFood() async {
    final scannerDisclaimerEnabled =
        await ref.read(foodListViewModel.notifier).isScannerDisclaimerEnabled();

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
          ref.read(foodListViewModel.notifier).disableScannerDisclaimer();
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
        .read(foodListViewModel.notifier)
        .searchHelper
        .searchController
        .updateQuery(query);
  }

  void _resetSearchQuery() {
    ref.read(foodListViewModel.notifier).searchHelper.searchController.reset();
  }

  void _addFood([Food? food]) async {
    final nutrientDefaults =
        await ref.read(foodListViewModel.notifier).getNutrientDefaults();

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

  void _viewFood(EdibleSearchResult searchResult) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodViewScreen(
          foodId: searchResult.id,
          onDeleteFood: (id) {
            _deleteFood(id);
          },
        ),
      ),
    );
  }

  void _deleteFood(String id) {
    ProgressOverlay.wrap(
      context,
      ref.read(foodListViewModel.notifier).deleteFood(id),
    );
  }

  void _restoreFood(String id) {
    ProgressOverlay.wrap(
      context,
      ref.read(foodListViewModel.notifier).restoreFood(id),
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
        _restoreFood(command.payload as String);
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
    final uiState = ref.watch(foodListViewModel);

    ref.listen(foodListViewModel, (prev, next) {
      _searchController.text = next.searchQuery;
    });

    final viewModel = ref.read(foodListViewModel.notifier);

    return AccessGuard(
      key: _accessGuardKey,
      child: UiSubordinate<FoodListCommand>(
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
            onSelectItem: _viewFood,
            onDeleteItem: (searchResult) {
              _deleteFood(searchResult.id);
            },
            noItemsMessage: l10n(context).messageFoodSearchNothingFound,
            confirmDeleteMessage: l10n(context).messageFoodDeletionConfirmation,
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
              selectedTab: ScreenTab.foods,
            ),
          ),
        ),
      ),
    );
  }
}
