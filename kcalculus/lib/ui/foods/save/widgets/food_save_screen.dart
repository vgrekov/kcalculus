import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/widgets/nutrition_facts_input.dart';
import 'package:kcalculus/ui/common/utils/ads.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/foods/save/view_models/food_save_ui_state.dart';
import 'package:kcalculus/ui/foods/save/view_models/food_save_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';

class FoodSaveScreen extends ConsumerStatefulWidget {
  const FoodSaveScreen({
    super.key,
    this.food,
    required this.nutrientDefaults,
  });

  final Food? food;

  final List<Nutrient> nutrientDefaults;

  @override
  ConsumerState<FoodSaveScreen> createState() {
    return _FoodSaveScreenState();
  }
}

class _FoodSaveScreenState extends ConsumerState<FoodSaveScreen>
    with StateMessenger {
  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _nutritionFactsController = NutritionFactsInputController();

  late FocusNode _nameFocusNode;

  late FocusNode _descriptionFocusNode;

  late FocusNode _nutritionFactsFocusNode;

  late final _assignments = <FoodSaveCommand, UiAssignment>{
    FoodSaveCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
    FoodSaveCommand.showEdibleAlreadyExistsDialog:
        _showEdibleAlreadyExistsDialog,
    FoodSaveCommand.confirmDiscardChanges: _confirmDiscardChanges,
    FoodSaveCommand.exit: _exitOnCommand,
  };

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _nutritionFactsFocusNode = FocusNode();

    final uiState = ref.read(foodSaveViewModel(widget.food));
    _loadUiState(uiState);

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

  void _loadUiState(FoodSaveUiState uiState) {
    _nameController.text = uiState.name;
    _descriptionController.text = uiState.description;
    _nutritionFactsController.load(uiState.nutritionFacts);
  }

  void _exit() {
    Navigator.of(context).pop();
  }

  void _tryExit() async {
    final viewModel = ref.read(foodSaveViewModel(widget.food).notifier);
    final shouldExit = await viewModel.shouldExit();
    if (mounted && shouldExit) {
      _exit();
    }
  }

  void _saveFood() async {
    if (!_form.currentState!.validate() ||
        !_nutritionFactsController.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    _form.currentState!.save();

    final viewModel = ref.read(foodSaveViewModel(widget.food).notifier);

    viewModel.updateState(
      name: _nameController.text,
      description: _descriptionController.text,
      nutritionFacts: _nutritionFactsController.save(),
    );

    await ProgressOverlay.wrap(
      context,
      viewModel.saveFood(),
    );
  }

  String? _validateFoodName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n(context).validationErrorEdibleNameMissing;
    }

    return null;
  }

  void _onUserInteractionChange() {
    final viewModel = ref.read(foodSaveViewModel(widget.food).notifier);
    viewModel.onUserInteractionChange();
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
          _nameFocusNode.requestFocus();
        },
      },
      messageType: MessageType.error,
    );
    command.complete();
  }

  void _confirmDiscardChanges(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    command.complete(
      showConfirmation(
        l10n(context).messageDiscardChangesConfirmation,
      ),
    );
  }

  void _exitOnCommand(
    UiCommand? command, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    await showInterstitialAd(ref);

    _exit();

    command?.complete();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(foodSaveViewModel(widget.food), (prev, next) {
      _loadUiState(next);
    });

    final viewModel = ref.read(foodSaveViewModel(widget.food).notifier);

    return UiSubordinate(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Inattentive(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: _tryExit,
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            centerTitle: true,
            title: Text(
              widget.food?.id != null
                  ? l10n(context).screenEditFood
                  : l10n(context).screenAddFood,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            actions: [
              TextButton(
                onPressed: _saveFood,
                child: Text(
                  l10n(context).actionSave,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
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
                      onChanged: (value) {
                        _onUserInteractionChange();
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
                      onChanged: (value) {
                        _onUserInteractionChange();
                      },
                    ),
                    const SizedBox(height: 32),
                    NutritionFactsInput(
                      defaultNutrients: widget.nutrientDefaults,
                      controller: _nutritionFactsController,
                      focusNode: _nutritionFactsFocusNode,
                      onUserInteractionChange: _onUserInteractionChange,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
