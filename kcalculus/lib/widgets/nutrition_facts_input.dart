import 'package:flutter/material.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';

class NutritionFactsInput extends StatefulWidget {
  final NutritionFactsInputController? controller;
  final bool enabled;

  const NutritionFactsInput({
    super.key,
    this.controller,
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
      return true;
    }

    return false;
  }

  bool _validate() {
    var isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();
      final index =
          _drafts.indexWhere((d) => d.fiberInGrams! > d.carbsInGrams!);
      if (index != -1) {
        isValid = false;
        if (_pageIndex != index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        }
        showNotification(l10n(context).validationErrorMoreFiberThanCarbs);
      }
    }

    return isValid;
  }

  void _onPageChanged(int index) {
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
      _selectDraft(draft);

      setState(() {
        _drafts.add(draft);
        _pageIndex++;
      });

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
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

    setState(() {
      _drafts.removeAt(_pageIndex);
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

  @override
  Widget build(BuildContext context) {
    _NutritionFactsDraft draft = _drafts[_pageIndex];
    final isLastPage = _pageIndex == _drafts.length - 1;
    final isDeletable = _drafts.length > 1;
    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: !widget.enabled || !isDeletable ? null : _deletePage,
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
              IconButton(
                onPressed: !widget.enabled || !isLastPage ? null : _addPage,
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
                final isEnabled = index == _pageIndex;
                return Padding(
                  key: UniqueKey(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: AmountInput(
                    controller: _perAmountController,
                    initialAmount: amount,
                    label: l10n(context).labelPer,
                    enabled: widget.enabled && isEnabled,
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
            label: l10n(context).labelCalories,
            initialUnit: Unit.calorie,
            initialValue: draft.calories,
            fixedUnit: true,
            onSaveAmount: (amount) {
              draft.calories = amount?.value;
            },
            enabled: widget.enabled,
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
