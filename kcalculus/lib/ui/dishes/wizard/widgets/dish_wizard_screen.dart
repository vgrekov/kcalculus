import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_ingredients_page.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_main_page.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_measurements_page.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_summary_page.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/inattentive.dart';
import 'package:kcalculus/widgets/page_indicator.dart';

class DishWizardScreen extends ConsumerStatefulWidget {
  const DishWizardScreen({
    super.key,
    this.dish,
  });

  final Dish? dish;

  @override
  ConsumerState<DishWizardScreen> createState() {
    return _DishWizardScreenState();
  }
}

class _DishWizardScreenState extends ConsumerState<DishWizardScreen>
    with StateMessenger, ProgressiveState {
  late final Map<DishWizardStep, GlobalKey> _pageKeys;

  int _currentPageIndex = 0;

  final _pageController = PageController(
    initialPage: 0,
  );

  late final _assignments = <DishWizardCommand, UiAssignment>{
    DishWizardCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
    DishWizardCommand.showEdibleAlreadyExistsDialog:
        _showEdibleAlreadyExistsDialog,
    DishWizardCommand.showIngredientsCycleDetectedNotification:
        _showIngredientsCycleDetectedNotification,
    DishWizardCommand.goToInvalidStep: _goToInvalidStep,
    DishWizardCommand.confirmDiscardChanges: _confirmDiscardChanges,
    DishWizardCommand.exit: _exitOnCommand,
  };

  void _exit() {
    Navigator.of(context).pop();
  }

  void _tryExit() async {
    final wizardPage = _getWizardPage(_currentPageIndex);

    if (wizardPage != null) {
      wizardPage.save(context, ref);
    }

    final viewModel = ref.read(dishWizardViewModel(widget.dish).notifier);

    final shouldExit = await viewModel.shouldExit();
    if (mounted && shouldExit) {
      _exit();
    }
  }

  void _saveDish() async {
    final wizardPage = _getWizardPage(_currentPageIndex);
    if (wizardPage != null) {
      wizardPage.save(context, ref);
      if (!wizardPage.validate(context, ref)) {
        return;
      }
    }

    wrapInProgress(
      ref.read(dishWizardViewModel(widget.dish).notifier).saveFood(),
    );
  }

  @override
  void initState() {
    _pageKeys = {for (final step in DishWizardStep.values) step: GlobalKey()};

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Update the state once the first frame is rendered
      setState(() {});
    });

    super.initState();
  }

  Widget _buildWizardPageWidget(DishWizardStep step) {
    final pageKey = _pageKeys[step];
    return switch (step) {
      DishWizardStep.main => DishWizardMainPage(
          key: pageKey,
          dish: widget.dish,
          pageController: _pageController,
        ),
      DishWizardStep.ingredients => DishWizardIngredientsPage(
          key: pageKey,
          dish: widget.dish,
        ),
      DishWizardStep.measurements => DishWizardMeasurementsPage(
          key: pageKey,
          dish: widget.dish,
        ),
      DishWizardStep.summary => DishWizardSummaryPage(
          key: pageKey,
          dish: widget.dish,
        ),
    };
  }

  DishWizardPage? _getWizardPage(int pageIndex) {
    final currenPageKey = _pageKeys[DishWizardStep.values[_currentPageIndex]]!;

    final pageWidget = currenPageKey.currentWidget;
    if (pageWidget != null && pageWidget is DishWizardPage) {
      return pageWidget as DishWizardPage;
    } else {
      final pageState = currenPageKey.currentState;
      if (pageState != null && pageState is DishWizardPage) {
        return pageState as DishWizardPage;
      }
    }

    return null;
  }

  void _onPageChanged(int newIndex) {
    final wizardPage = _getWizardPage(_currentPageIndex);

    if (wizardPage != null) {
      wizardPage.save(context, ref);
    }

    bool stayPut = false;
    if (newIndex > _currentPageIndex) {
      if (wizardPage != null) {
        stayPut = !wizardPage.validate(context, ref);
      }
    }

    if (stayPut) {
      _pageController.jumpToPage(_currentPageIndex);
    } else {
      setState(() {
        _currentPageIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();

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

  void _showEdibleAlreadyExistsDialog(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showMessageDialog<void>(
      message: l10n(context).messageEdibleAlreadyExists,
      actions: {
        l10n(context).actionOk: () {
          _pageController.animateToPage(
            DishWizardStep.values.indexOf(DishWizardStep.main),
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
      },
      messageType: MessageType.error,
    );
    command.complete();
  }

  void _showIngredientsCycleDetectedNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    _pageController.animateToPage(
      DishWizardStep.values.indexOf(DishWizardStep.ingredients),
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    showNotification(l10n(context).validationErrorIngredientsCycleDetected);
    command.complete();
  }

  void _confirmDiscardChanges(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    command.complete(
      showConfirmation(
        widget.dish?.id == null
            ? l10n(context).messageNewDishCancellationConfirmation
            : l10n(context).messageEditDishCancellationConfirmation,
      ),
    );
  }

  void _goToInvalidStep(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final invalidStep = command.payload as DishWizardStep;
    _pageController.animateToPage(
      DishWizardStep.values.indexOf(invalidStep),
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    command.complete();
  }

  void _exitOnCommand(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    _exit();
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(dishWizardViewModel(widget.dish));

    ScaffoldConfig? scaffoldConfig =
        _getWizardPage(_currentPageIndex)?.buildScaffoldConfig(context, ref);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _tryExit();
      },
      child: UiSubordinate<DishWizardCommand>(
        commandProvider:
            ref.read(dishWizardViewModel(widget.dish).notifier).commandProvider,
        assignments: _assignments,
        child: Inattentive(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: _tryExit,
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              centerTitle: true,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.dish?.id == null
                        ? l10n(context).screenAddDish
                        : l10n(context).screenEditDish,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  if (scaffoldConfig?.subtitle != null)
                    Text(
                      scaffoldConfig!.subtitle!,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: _saveDish,
                  child: Text(l10n(context).actionSave),
                ),
              ],
            ),
            body: PageView.builder(
              controller: _pageController,
              pageSnapping: true,
              itemCount: DishWizardStep.values.length,
              itemBuilder: (context, index) {
                final step = DishWizardStep.values[index];
                return _buildWizardPageWidget(step);
              },
              onPageChanged: _onPageChanged,
            ),
            floatingActionButton: scaffoldConfig?.floatingActionButton,
            floatingActionButtonLocation:
                scaffoldConfig?.floatingActionButtonLocation ??
                    FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(bottom: 16),
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (scaffoldConfig?.bottomNavigationBar != null)
                    scaffoldConfig!.bottomNavigationBar!,
                  PageIndicator(
                    pageController: _pageController,
                    pageCount: DishWizardStep.values.length,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScaffoldConfig {
  final String? subtitle;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  const ScaffoldConfig({
    this.subtitle,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });
}

abstract interface class DishWizardPage {
  bool validate(BuildContext context, WidgetRef ref);

  void save(BuildContext context, WidgetRef ref);

  ScaffoldConfig? buildScaffoldConfig(BuildContext context, WidgetRef ref);
}
