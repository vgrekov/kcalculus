import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/foods.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/progressive.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';
import 'package:kcalculus/widgets/text_input.dart';

class SaveFoodScreen extends ConsumerStatefulWidget {
  final Food? food;

  const SaveFoodScreen({
    super.key,
    this.food,
  });

  @override
  ConsumerState<SaveFoodScreen> createState() {
    return _SaveFoodScreenState();
  }
}

class _SaveFoodScreenState extends ConsumerState<SaveFoodScreen>
    with StateMessenger, ProgressiveState {
  String _name = '';
  String _description = '';

  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nutritionFactsController = NutritionFactsInputController();

  late FocusNode _nameFocusNode;
  late FocusNode _descriptionFocusNode;
  late FocusNode _nutritionFactsFocusNode;

  @override
  void initState() {
    if (widget.food != null) {
      _nameController.text = widget.food!.name;
      _descriptionController.text = widget.food!.description;
      _nutritionFactsController.nutritionFacts =
          widget.food!.getNutritionFacts();
    }

    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _nutritionFactsFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _nutritionFactsController.dispose();

    _nutritionFactsFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  void _exit() {
    Navigator.of(context).pop();
  }

  void _saveFood() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _nutritionFactsController.validate();
    if (!_nutritionFactsController.isValid) {
      return;
    }

    _form.currentState!.save();
    _nutritionFactsController.save();

    final food = await getFood();
    if (food == null) {
      return;
    }

    showProgress();

    try {
      await ref.read(foodsProvider.notifier).saveFood(food);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      showNotification(error.toString());
    }

    hideProgress();
  }

  FutureOr<Food?> getFood() async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final alreadyExists = await edibleDao.exists(
      _name,
      _description,
      exceptWithId: widget.food?.id,
    );

    if (alreadyExists) {
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

    return Food(
      id: widget.food?.id,
      name: _name,
      description: _description,
      nutritionFacts: _nutritionFactsController.nutritionFacts!,
    );
  }

  String? _validateFoodName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n(context).validationErrorEdibleNameMissing;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: _exit,
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.food != null
              ? l10n(context).screenEditFood
              : l10n(context).screenAddFood,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        actions: [
          TextButton(
            onPressed: _saveFood,
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
                TextInput(
                  controller: _nameController,
                  autofocus: true,
                  focusNode: _nameFocusNode,
                  labelText: l10n(context).labelEdibleName,
                  maxLength: 50,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: _validateFoodName,
                  onFieldSubmitted: (value) {
                    _descriptionFocusNode.requestFocus();
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  controller: _descriptionController,
                  labelText: l10n(context).labelEdibleDescription,
                  hintText: l10n(context).hintEdibleDescription,
                  maxLength: 100,
                  maxLines: 2,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    _nutritionFactsFocusNode.requestFocus();
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
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
