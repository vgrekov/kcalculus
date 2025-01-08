import 'package:flutter/material.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';

class NutritionFactsInput extends StatefulWidget {
  final NutritionFactsInputController? controller;
  final FocusNode? focusNode;
  final bool enabled;

  const NutritionFactsInput({
    super.key,
    this.controller,
    this.focusNode,
    this.enabled = true,
  });

  @override
  State<StatefulWidget> createState() {
    return _NutritionFactsInputState();
  }
}

class _NutritionFactsInputState extends State<NutritionFactsInput>
    with StateMessenger {
  late List<_NutritionFactsDraft> _drafts;
  int _pageIndex = 0;

  final _form = GlobalKey<FormState>();

  final _pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );

  final _perAmountController = AmountInputController();
  final _caloriesAmountController = AmountInputController();
  final _fatAmountController = AmountInputController();
  final _carbsAmountController = AmountInputController();
  final _fiberAmountController = AmountInputController();
  final _proteinAmountController = AmountInputController();

  late List<FocusNode> _perAmountFocusNodes;
  late FocusNode _caloriesFocusNode;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.addListener(_onControllerCommand);
    }

    if (!_loadDraftsFromController()) {
      _drafts = [
        _NutritionFactsDraft(),
      ];
    }

    _perAmountFocusNodes = _drafts.map((d) => FocusNode()).toList();
    _caloriesFocusNode = FocusNode();

    widget.focusNode?.addListener(widgetFocusListener);

    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerCommand);

    _perAmountController.dispose();
    _caloriesAmountController.dispose();
    _fatAmountController.dispose();
    _carbsAmountController.dispose();
    _fiberAmountController.dispose();
    _proteinAmountController.dispose();

    widget.focusNode?.removeListener(widgetFocusListener);

    _caloriesFocusNode.dispose();
    for (final node in _perAmountFocusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  void _onControllerCommand() {
    if (widget.controller?._command != null) {
      switch (widget.controller!._command!) {
        case _NutritionFactsInputControllerCommand.load:
          if (_loadDraftsFromController() && _drafts.isNotEmpty) {
            setState(() {
              _pageIndex = 0;
            });
            _pageController.jumpToPage(0);
            _selectDraft(_drafts[0]);
          }
          break;
        case _NutritionFactsInputControllerCommand.validate:
          widget.controller!._isValid = _validate();
          break;
        case _NutritionFactsInputControllerCommand.save:
          _form.currentState!.save();
          widget.controller!._nutritionFacts =
              _drafts.map((d) => d.toCleanCopy()).toList();
          break;
      }
    }
  }

  bool _loadDraftsFromController() {
    if (widget.controller?.nutritionFacts != null) {
      _drafts = widget.controller!.nutritionFacts!
          .map(_NutritionFactsDraft.fromCleanCopy)
          .toList();
      _perAmountFocusNodes = _drafts.map((d) => FocusNode()).toList();

      return true;
    }

    return false;
  }

  bool _validate() {
    var isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();

      final validationPair = _drafts
          .map(_validateDraft)
          .indexed
          .where((pair) => pair.$2 != null)
          .firstOrNull;
      if (validationPair != null) {
        isValid = false;

        final index = validationPair.$1;
        final message = validationPair.$2;

        if (_pageIndex != index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        }

        showNotification(message!);
      }
    }

    return isValid;
  }

  String? _validateDraft(_NutritionFactsDraft draft) {
    if (draft.fiberInGrams! > draft.carbsInGrams!) {
      return l10n(context).validationErrorMoreFiberThanCarbs;
    }

    if (draft.fatInGrams! == 0 &&
        draft.proteinInGrams! == 0 &&
        (draft.carbsInGrams! - draft.fiberInGrams!) == 0) {
      return l10n(context).validationErrorNoNutrients;
    }

    return null;
  }

  void _onPageChanged(int index) {
    final perAmountHadFocus = _pageIndex < _perAmountFocusNodes.length
        ? _perAmountFocusNodes[_pageIndex].hasFocus
        : false;

    FocusManager.instance.primaryFocus?.unfocus();

    if (_pageIndex != index) {
      if (_form.currentState!.validate()) {
        _form.currentState!.save();

        if (index < _drafts.length) {
          _selectDraft(_drafts[index]);
        }

        setState(() {
          _pageIndex = index;
        });
      } else {
        _pageController.jumpToPage(_pageIndex);
      }
    }

    if (perAmountHadFocus) {
      requestFocusForPerAmount();
    }
  }

  void _addPage() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();

      final lastDraft = _drafts[_pageIndex];
      final draft = _NutritionFactsDraft(
        calories: lastDraft.calories,
        fatInGrams: lastDraft.fatInGrams,
        carbsInGrams: lastDraft.carbsInGrams,
        fiberInGrams: lastDraft.fiberInGrams,
        proteinInGrams: lastDraft.proteinInGrams,
      );
      _drafts.add(draft);

      final focusNode = FocusNode();
      _perAmountFocusNodes.add(focusNode);

      setState(() {
        _pageIndex = _drafts.length - 1;
      });

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );

      requestFocusForPerAmount();
    }
  }

  void _deletePage() {
    final _NutritionFactsDraft draft;
    final int newIndex;
    if (_pageIndex < _drafts.length - 1) {
      draft = _drafts[_pageIndex + 1];
      newIndex = _pageIndex;
    } else {
      draft = _drafts[_pageIndex - 1];
      newIndex = _pageIndex - 1;
    }
    _selectDraft(draft);

    _drafts.removeAt(_pageIndex);

    _perAmountFocusNodes.removeAt(_pageIndex).dispose();

    setState(() {
      _pageIndex = newIndex;
    });

    _pageController.animateToPage(
      _pageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void _selectDraft(_NutritionFactsDraft draft) {
    _perAmountController.setAmount(draft.amount);
    _caloriesAmountController.setValue(draft.calories);
    _fatAmountController.setValue(draft.fatInGrams);
    _carbsAmountController.setValue(draft.carbsInGrams);
    _fiberAmountController.setValue(draft.fiberInGrams);
    _proteinAmountController.setValue(draft.proteinInGrams);
  }

  void widgetFocusListener() {
    if (widget.focusNode?.hasFocus ?? false) {
      requestFocusForPerAmount();
    }
  }

  void requestFocusForPerAmount() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _perAmountFocusNodes[_pageIndex].requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _NutritionFactsDraft draft = _drafts[_pageIndex];
    final isLastPage = _pageIndex == _drafts.length - 1;
    final isDeletable = _drafts.length > 1;
    return Focus(
      focusNode: widget.focusNode,
      child: Form(
        key: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.enabled)
                  IconButton(
                    onPressed: !isDeletable ? null : _deletePage,
                    icon: const Icon(Icons.remove),
                    color: Theme.of(context).colorScheme.primary,
                    iconSize: 24,
                  ),
                Text(
                  l10n(context).titleNutritionFacts,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                if (widget.enabled)
                  IconButton(
                    onPressed: !isLastPage ? null : _addPage,
                    icon: const Icon(Icons.add),
                    color: Theme.of(context).colorScheme.primary,
                    iconSize: 24,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 90,
              child: PageView.builder(
                controller: _pageController,
                pageSnapping: true,
                itemCount: _drafts.length,
                itemBuilder: (context, index) {
                  final amount = _drafts[index].amount;
                  final focusNode = _perAmountFocusNodes[index];
                  final isEnabled = index == _pageIndex;
                  return Padding(
                    key: UniqueKey(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: AmountInput(
                      controller: _perAmountController,
                      focusNode: focusNode,
                      initialAmount: amount,
                      label: l10n(context).labelPer,
                      enabled: widget.enabled && isEnabled,
                      allowZero: false,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        _caloriesFocusNode.requestFocus();
                      },
                      onSaveAmount: (amount) {
                        _drafts[index].amount = amount;
                      },
                    ),
                  );
                },
                onPageChanged: _onPageChanged,
              ),
            ),
            const SizedBox(height: 16),
            AmountInput(
              controller: _caloriesAmountController,
              focusNode: _caloriesFocusNode,
              label: l10n(context).labelCalories,
              initialUnit: Unit.calorie,
              initialValue: draft.calories,
              fixedUnit: true,
              textInputAction: TextInputAction.next,
              onSaveAmount: (amount) {
                draft.calories = amount?.value;
              },
              enabled: widget.enabled,
              allowZero: false,
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AmountInput(
                    controller: _fatAmountController,
                    label: l10n(context).labelFat,
                    initialUnit: Unit.gram,
                    initialValue: draft.fatInGrams,
                    fixedUnit: true,
                    textInputAction: TextInputAction.next,
                    onSaveAmount: (amount) {
                      draft.fatInGrams = amount?.value;
                    },
                    enabled: widget.enabled,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AmountInput(
                    controller: _carbsAmountController,
                    label: l10n(context).labelCarbs,
                    initialUnit: Unit.gram,
                    initialValue: draft.carbsInGrams,
                    fixedUnit: true,
                    textInputAction: TextInputAction.next,
                    onSaveAmount: (amount) {
                      draft.carbsInGrams = amount?.value;
                    },
                    enabled: widget.enabled,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AmountInput(
                    controller: _fiberAmountController,
                    label: l10n(context).labelFiber,
                    initialUnit: Unit.gram,
                    initialValue: draft.fiberInGrams,
                    fixedUnit: true,
                    textInputAction: TextInputAction.next,
                    onSaveAmount: (amount) {
                      draft.fiberInGrams = amount?.value;
                    },
                    enabled: widget.enabled,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AmountInput(
                    controller: _proteinAmountController,
                    label: l10n(context).labelProtein,
                    initialUnit: Unit.gram,
                    initialValue: draft.proteinInGrams,
                    fixedUnit: true,
                    textInputAction: TextInputAction.done,
                    onSaveAmount: (amount) {
                      draft.proteinInGrams = amount?.value;
                    },
                    enabled: widget.enabled,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NutritionFactsDraft {
  Amount? amount;
  double? calories;
  double? fatInGrams;
  double? carbsInGrams;
  double? fiberInGrams;
  double? proteinInGrams;

  _NutritionFactsDraft({
    this.amount,
    this.calories,
    this.fatInGrams,
    this.carbsInGrams,
    this.fiberInGrams,
    this.proteinInGrams,
  });

  factory _NutritionFactsDraft.fromCleanCopy(NutritionFacts cleanCopy) {
    return _NutritionFactsDraft(
      amount: cleanCopy.amount,
      calories: cleanCopy.nutrientData.calories,
      fatInGrams: cleanCopy.nutrientData.fatInGrams,
      carbsInGrams: cleanCopy.nutrientData.carbsInGrams,
      fiberInGrams: cleanCopy.nutrientData.fiberInGrams,
      proteinInGrams: cleanCopy.nutrientData.proteinInGrams,
    );
  }

  NutritionFacts toCleanCopy() {
    return NutritionFacts(
      amount: amount!,
      nutrientData: NutrientData(
        calories: calories!,
        fatInGrams: fatInGrams!,
        carbsInGrams: carbsInGrams!,
        fiberInGrams: fiberInGrams!,
        proteinInGrams: proteinInGrams!,
      ),
    );
  }
}

enum _NutritionFactsInputControllerCommand {
  load,
  validate,
  save,
}

class NutritionFactsInputController extends ChangeNotifier {
  bool _isValid = false;
  List<NutritionFacts>? _nutritionFacts;

  _NutritionFactsInputControllerCommand? _command;

  NutritionFactsInputController({
    List<NutritionFacts>? nutritionFacts,
  }) : _nutritionFacts = nutritionFacts;

  bool get isValid => _isValid;

  List<NutritionFacts>? get nutritionFacts => _nutritionFacts;

  set nutritionFacts(List<NutritionFacts>? value) {
    _nutritionFacts = value;
    _command = _NutritionFactsInputControllerCommand.load;
    notifyListeners();
  }

  void validate() {
    _command = _NutritionFactsInputControllerCommand.validate;
    notifyListeners();
  }

  void save() {
    _command = _NutritionFactsInputControllerCommand.save;
    notifyListeners();
  }
}
