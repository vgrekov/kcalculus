import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/data/dishes.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard_ingredients.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard_main.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard_measurements.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard_summary.dart';
import 'package:kcalculus/utils/exceptions.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/page_indicator.dart';

class DishWizardScreen extends ConsumerStatefulWidget {
  const DishWizardScreen({super.key});

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

  void _saveDish() async {
    final wizardPage = _getWizardPage(_currentPageIndex);
    if (wizardPage != null) {
      wizardPage.save(context, ref);
      if (!wizardPage.validate(context, ref)) {
        return;
      }
    }

    final wizardState = ref.read(dishWizardProvider).data;

    final invalidStep =
        wizardState.validate().entries.where((e) => !e.value).firstOrNull?.key;
    if (invalidStep != null) {
      _pageController.animateToPage(
        DishWizardStep.values.indexOf(invalidStep),
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      return;
    }

    showProgress();

    try {
      await ref.read(dishesProvider.notifier).saveDish(
            wizardState.toDish(),
          );
      if (mounted) {
        Navigator.of(context).pop();
      }
    } on DuplicationException {
      if (mounted) {
        showMessageDialog<void>(
          message: l10n(context).messageEdibleAlreadyExists,
          actions: {
            l10n(context).actionOk: () {
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            },
          },
          messageType: MessageType.error,
        );
      }
    } catch (error) {
      showNotification(error.toString());
    }

    hideProgress();
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
          pageController: _pageController,
        ),
      DishWizardStep.ingredients => DishWizardIngredientsPage(
          key: pageKey,
        ),
      DishWizardStep.measurements => DishWizardMeasurementsPage(
          key: pageKey,
        ),
      DishWizardStep.summary => DishWizardSummaryPage(
          key: pageKey,
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

  void _confirmCancellation() async {
    final wizardPage = _getWizardPage(_currentPageIndex);

    if (wizardPage != null) {
      wizardPage.save(context, ref);
    }

    final wizardState = ref.read(dishWizardProvider).data;

    final bool? shouldExit;
    if (wizardState.hasChanges) {
      shouldExit = await showConfirmation(
        wizardState.id == null
            ? l10n(context).messageNewDishCancellationConfirmation
            : l10n(context).messageEditDishCancellationConfirmation,
      );
    } else {
      shouldExit = true;
    }

    if (mounted && shouldExit == true) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wizardState = ref.watch(dishWizardProvider).data;

    ScaffoldConfig? scaffoldConfig =
        _getWizardPage(_currentPageIndex)?.buildScaffoldConfig(context, ref);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _confirmCancellation();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                wizardState.id == null
                    ? l10n(context).screenAddDish
                    : l10n(context).screenEditDish,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
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
