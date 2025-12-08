import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/ui/access_guard/utils/premium_feature.dart';
import 'package:kcalculus/ui/access_guard/widgets/access_guard.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/widget_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/ui/common/widgets/premium_badge.dart';
import 'package:kcalculus/ui/common/widgets/screen_tab_bar.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/dishes/view/widgets/dish_view_screen.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/ui/edibles/common/edible_previews/widgets/edible_previews.dart';
import 'package:kcalculus/ui/edibles/list/view_models/edible_list_view_model.dart';
import 'package:kcalculus/ui/edibles/list/widgets/edible_add_fab.dart';
import 'package:kcalculus/ui/edibles/search/widgets/edible_search_screen.dart';
import 'package:kcalculus/ui/foods/save/widgets/food_save_screen.dart';
import 'package:kcalculus/ui/foods/scan/widgets/food_scan_screen.dart';
import 'package:kcalculus/ui/foods/view/widgets/food_view_screen.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final _log = Logger('EdibleListScreen');

class EdibleListScreen extends ConsumerWidget with WidgetMessenger {
  EdibleListScreen({super.key});

  late final _assignments = <EdibleListCommand, UiAssignment>{
    EdibleListCommand.showDeletionSuccessNotification:
        _showDeletionSuccessNotification,
    EdibleListCommand.showDeletionFailureNotification:
        _showDeletionFailureNotification,
    EdibleListCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
  };

  final _accessGuardKey = UniqueKey();

  void _scanFood(BuildContext context, WidgetRef ref) async {
    final scannerDisclaimerEnabled = await ref
        .read(edibleListViewModel.notifier)
        .isScannerDisclaimerEnabled();

    if (context.mounted) {
      if (scannerDisclaimerEnabled) {
        _showScannerDisclaimer(context, ref);
      } else {
        _doScanFood(context, ref);
      }
    }
  }

  void _showScannerDisclaimer(BuildContext context, WidgetRef ref) {
    showMessageDialog(
      context: context,
      message: l10n(context).messageScannerDisclaimer,
      actions: {
        l10n(context).actionOk: () => _doScanFood(context, ref),
        l10n(context).actionDontShowAgain: () {
          ref.read(edibleListViewModel.notifier).disableScannerDisclaimer();
          _doScanFood(context, ref);
        },
      },
      messageType: MessageType.warning,
    );
  }

  void _doScanFood(BuildContext context, WidgetRef ref) async {
    premiumFeature(ref, _accessGuardKey, () async {
      _log.eventFoodScan();

      final food = await showModalBottomSheet<Food>(
        context: context,
        scrollControlDisabledMaxHeightRatio: 0.9,
        builder: (context) => const FoodScanScreen(),
      );

      if (food != null && context.mounted) {
        _addFood(context, ref, food);
      }
    });
  }

  void _search(BuildContext context, WidgetRef ref) async {
    final preview = await Navigator.of(context).push<EdiblePreview>(
      MaterialPageRoute(
        builder: (context) => EdibleSearchScreen.preview(),
      ),
    );

    if (preview != null && context.mounted) {
      _viewEdible(context, ref, preview);
    }
  }

  void _addFood(BuildContext context, WidgetRef ref, [Food? food]) async {
    final nutrientDefaults = await ref
        .read(edibleListViewModel.notifier)
        .getNutrientDefaults();

    if (context.mounted) {
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

  void _addDish(BuildContext context, WidgetRef ref) async {
    final nutrientDefaults = await ref
        .read(edibleListViewModel.notifier)
        .getNutrientDefaults();

    if (context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DishWizardScreen(
            nutrientDefaults: nutrientDefaults,
          ),
        ),
      );
    }
  }

  void _viewEdible(
    BuildContext context,
    WidgetRef ref,
    EdiblePreview preview,
  ) {
    switch (preview.type) {
      case EdiblePreviewType.food:
      case EdiblePreviewType.usda:
        _viewFood(context, ref, preview);

        break;
      case EdiblePreviewType.dish:
        _viewDish(context, ref, preview);

        break;
    }
  }

  void _viewFood(
    BuildContext context,
    WidgetRef ref,
    EdiblePreview preview,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodViewScreen(
          foodId: preview.id,
          isUsdaFood: preview.type == EdiblePreviewType.usda,
          onDeleteFood: (_) {
            _deleteEdible(context, ref, preview);
          },
        ),
      ),
    );
  }

  void _viewDish(
    BuildContext context,
    WidgetRef ref,
    EdiblePreview preview,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DishViewScreen(
          dishId: preview.id,
          onDeleteDish: (_) {
            _deleteEdible(context, ref, preview);
          },
        ),
      ),
    );
  }

  void _deleteEdible(
    BuildContext context,
    WidgetRef ref,
    EdiblePreview preview,
  ) {
    ProgressOverlay.wrap(
      context,
      ref.read(edibleListViewModel.notifier).deleteEdible(preview),
    );
  }

  void _restoreEdible(
    BuildContext context,
    WidgetRef ref,
    EdiblePreview preview,
  ) {
    ProgressOverlay.wrap(
      context,
      ref.read(edibleListViewModel.notifier).restoreEdible(preview),
    );
  }

  void _showDeletionSuccessNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotificationWithUndo(
      context,
      l10n(context).messageFoodDeletionSuccess,
      undoAction: () {
        _restoreEdible(context, ref, command.payload as EdiblePreview);
      },
    );
    command.complete();
  }

  void _showDeletionFailureNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(
      context,
      l10n(context).messageFoodDeletionFailure,
    );
    command.complete();
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(
      context,
      l10n(context).messageUnknownError,
    );
    command.complete();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(edibleListViewModel);

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
            actions: [
              IconButton(
                onPressed: () {
                  _scanFood(context, ref);
                },
                icon: PremiumBadge(
                  child: Icon(
                    Icons.qr_code_scanner,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _search(context, ref);
                },
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          body: EdiblePreviews(
            items: uiState,
            onLoadNextPage: () => ref
                .read(
                  edibleListViewModel.notifier,
                )
                .loadNextPage(),
            onRefresh: () => ref
                .read(
                  edibleListViewModel.notifier,
                )
                .refresh(),
            onSelectItem: (item) {
              _viewEdible(context, ref, item);
            },
            onDeleteItem: (item) {
              _deleteEdible(context, ref, item);
            },
            noItemsMessage: l10n(context).messageEdibleSearchNothingFound,
            confirmDeleteMessage: (preview) => switch (preview.type) {
              EdiblePreviewType.food => l10n(
                context,
              ).messageFoodDeletionConfirmation,
              EdiblePreviewType.dish => l10n(
                context,
              ).messageDishDeletionConfirmation,
              _ => null,
            },
          ),
          floatingActionButton: Awaited(
            future: uiState,
            data: (_, _) => EdibleAddFab(
              onAddFood: () {
                _addFood(context, ref);
              },
              onAddDish: () {
                _addDish(context, ref);
              },
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
