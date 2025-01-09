import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/edibles.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/screens/common/edible_search.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/widgets/edible_name_input.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';
import 'package:kcalculus/widgets/text_input.dart';

class AddPortionScreen extends ConsumerStatefulWidget {
  final String title;
  final FutureOr<void> Function(Edible, Amount) onSavePortion;
  final bool Function(EdibleSearchResult)? edibleSearchFilter;

  const AddPortionScreen({
    super.key,
    required this.title,
    required this.onSavePortion,
    this.edibleSearchFilter,
  });

  @override
  ConsumerState<AddPortionScreen> createState() {
    return _AddPortionScreenState();
  }
}

class _AddPortionScreenState extends ConsumerState<AddPortionScreen>
    with StateMessenger, ProgressiveState {
  Edible? _selectedEdible;

  String _name = '';
  String _description = '';
  Amount? _amount;

  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nutritionFactsController = NutritionFactsInputController();

  late FocusNode _nameFocusNode;
  late FocusNode _descriptionFocusNode;
  late FocusNode _amountFocusNode;
  late FocusNode _nutritionFactsFocusNode;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _amountFocusNode = FocusNode();
    _nutritionFactsFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _nutritionFactsController.dispose();

    _nutritionFactsFocusNode.dispose();
    _amountFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  void _savePortion() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _nutritionFactsController.validate();
    if (!_nutritionFactsController.isValid) {
      return;
    }

    _form.currentState!.save();
    _nutritionFactsController.save();

    if (!_checkIfCommonMeasureExists()) {
      return;
    }

    final edible = await getEdible();
    if (edible == null) {
      return;
    }

    showProgress();

    try {
      await widget.onSavePortion(edible, _amount!);

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      showNotification(error.toString());
    }

    hideProgress();
  }

  void _searchEdibles() {
    String query = _nameController.text;
    ref.read(edibleSearchQueryProvider.notifier).setQuery(query);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EdibleSearchScreen(
          onSelectEdible: _selectEdible,
          edibleSearchFilter: widget.edibleSearchFilter,
        ),
      ),
    );
  }

  void _selectEdible(Edible edible) {
    _selectedEdible = edible;
    _nameController.text = edible.name;
    _descriptionController.text = edible.description;
    _nutritionFactsController.nutritionFacts = edible.getNutritionFacts();
    _amountFocusNode.requestFocus();
  }

  bool _checkIfCommonMeasureExists() {
    final nutritionFacts = _nutritionFactsController.nutritionFacts!;
    final hasCommonMeasure = nutritionFacts
        .any((nf) => nf.amount.unit.measure == _amount!.unit.measure);
    if (!hasCommonMeasure) {
      showMessage(
        l10n(context).messageNoCommonMeasureError(
          _amount!.unit.localName(context),
          _amount!.unit.measure.localName(context),
        ),
        MessageType.error,
      );
      return false;
    }

    return true;
  }

  bool? _isSelectedEdibleModified() {
    if (_selectedEdible != null) {
      if (_selectedEdible!.name != _name ||
          _selectedEdible!.description != _description) {
        return true;
      }

      final nutritionFactsEntered =
          _nutritionFactsController.nutritionFacts!.toSet();
      final nutritionFactsSelected =
          _selectedEdible!.getNutritionFacts().toSet();
      if (!setEquals(nutritionFactsEntered, nutritionFactsSelected)) {
        return true;
      }

      return false;
    }

    return null;
  }

  FutureOr<Edible?> getEdible() async {
    final selectedEdibleModified = _isSelectedEdibleModified();

    if (selectedEdibleModified == false) {
      return _selectedEdible;
    }

    final edibleDao = await ref.read(edibleDaoProvider);
    final alreadyExists = await edibleDao.exists(_name, _description);

    if (selectedEdibleModified == null && alreadyExists) {
      if (mounted) {
        showMessageDialog<void>(
          message: l10n(context).messageEdibleAlreadyExists,
          actions: {
            l10n(context).actionOk: () {
              _nameFocusNode.requestFocus();
            },
          },
          messageType: MessageType.error,
        );
      }
      return null;
    }

    if (selectedEdibleModified == true && alreadyExists) {
      if (mounted) {
        showMessageDialog<void>(
          message: l10n(context).messageSelectedEdibleModifiedAlreadyExists,
          actions: {
            l10n(context).actionOk: () {
              _nameFocusNode.requestFocus();
            },
          },
          messageType: MessageType.error,
        );
      }
      return null;
    }

    if (selectedEdibleModified == true && !alreadyExists) {
      if (mounted) {
        return showMessageDialog<Edible>(
          message: l10n(context).messageSelectedEdibleModifiedCreatesNew,
          actions: {
            l10n(context).actionCancel: () => null,
            l10n(context).actionUseSelectedEdible: () => _selectedEdible,
            l10n(context).actionCreateNewEdible: () => _buildFood(),
          },
          messageType: MessageType.confirm,
        );
      }
      return null;
    }

    return _buildFood();
  }

  Edible _buildFood() {
    return Food(
      name: _name,
      description: _description,
      nutritionFacts: _nutritionFactsController.nutritionFacts!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        actions: [
          TextButton(
            onPressed: _savePortion,
            child: Text(l10n(context).actionSave),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'search-box',
                  child: Material(
                    type: MaterialType.transparency,
                    child: EdibleNameInput(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        _descriptionFocusNode.requestFocus();
                      },
                      onSearchPressed: _searchEdibles,
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextInput(
                  controller: _descriptionController,
                  focusNode: _descriptionFocusNode,
                  labelText: l10n(context).labelEdibleDescription,
                  hintText: l10n(context).hintEdibleDescription,
                  maxLength: 100,
                  maxLines: 2,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    _amountFocusNode.requestFocus();
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                const SizedBox(height: 8),
                AmountInput(
                  label: l10n(context).labelPortionAmount,
                  initialUnit: Unit.gram,
                  focusNode: _amountFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    _nutritionFactsFocusNode.requestFocus();
                  },
                  onSaveAmount: (amount) {
                    _amount = amount;
                  },
                  allowZero: false,
                ),
                const SizedBox(height: 32),
                NutritionFactsInput(
                  controller: _nutritionFactsController,
                  focusNode: _nutritionFactsFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
