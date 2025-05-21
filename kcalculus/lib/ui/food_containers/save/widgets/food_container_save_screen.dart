import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/ui/common/utils/ads.dart';
import 'package:kcalculus/ui/common/utils/messaging/message_type.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/food_containers/save/view_models/food_container_save_ui_state.dart';
import 'package:kcalculus/ui/food_containers/save/view_models/food_container_save_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';

class FoodContainerSaveScreen extends ConsumerStatefulWidget {
  const FoodContainerSaveScreen({
    super.key,
    this.container,
  });

  final FoodContainer? container;

  @override
  ConsumerState<FoodContainerSaveScreen> createState() {
    return _FoodContainerSaveScreenState();
  }
}

class _FoodContainerSaveScreenState
    extends ConsumerState<FoodContainerSaveScreen> with StateMessenger {
  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _weightController = AmountInputController();

  late FocusNode _nameFocusNode;

  late FocusNode _descriptionFocusNode;

  late FocusNode _weightFocusNode;

  late final _assignments = <FoodContainerSaveCommand, UiAssignment>{
    FoodContainerSaveCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
    FoodContainerSaveCommand.showContainerAlreadyExistsDialog:
        _showContainerAlreadyExistsDialog,
    FoodContainerSaveCommand.confirmDiscardChanges: _confirmDiscardChanges,
    FoodContainerSaveCommand.exit: _exitOnCommand,
  };

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _weightFocusNode = FocusNode();

    final uiState = ref.read(foodContainerSaveViewModel(widget.container));
    _loadUiState(uiState);

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _weightController.dispose();

    _weightFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  void _loadUiState(FoodContainerSaveUiState uiState) {
    _nameController.text = uiState.name;
    _descriptionController.text = uiState.description;
    _weightController.setUnit(uiState.weightUnit);
    _weightController.setValue(uiState.weightValue);
  }

  void _exit() {
    Navigator.of(context).pop();
  }

  void _tryExit() async {
    final viewModel =
        ref.read(foodContainerSaveViewModel(widget.container).notifier);
    final shouldExit = await viewModel.shouldExit();
    if (mounted && shouldExit) {
      _exit();
    }
  }

  void _saveFoodContainer() async {
    if (!_form.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    _form.currentState!.save();

    final viewModel =
        ref.read(foodContainerSaveViewModel(widget.container).notifier);

    viewModel.updateState(
      name: _nameController.text,
      description: _descriptionController.text,
      weightUnit: _weightController.unit!,
      weightValue: _weightController.value,
    );

    await ProgressOverlay.wrap(
      context,
      viewModel.saveFoodContainer(),
    );
  }

  String? _validateFoodContainerName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n(context).validationErrorFoodContainerNameMissing;
    }

    return null;
  }

  void _onUserInteractionChange() {
    final viewModel = ref.read(
      foodContainerSaveViewModel(widget.container).notifier,
    );
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

  void _showContainerAlreadyExistsDialog(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showMessageDialog<void>(
      message: l10n(context).messageFoodContainerAlreadyExists,
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
        widget.container?.id == null
            ? l10n(context).messageNewFoodContainerCancellationConfirmation
            : l10n(context).messageEditFoodContainerCancellationConfirmation,
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
    ref.listen(foodContainerSaveViewModel(widget.container), (prev, next) {
      _loadUiState(next);
    });

    final viewModel = ref.read(
      foodContainerSaveViewModel(widget.container).notifier,
    );

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
              widget.container?.id != null
                  ? l10n(context).screenEditFoodContainer
                  : l10n(context).screenAddFoodContainer,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            actions: [
              TextButton(
                onPressed: _saveFoodContainer,
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
                      labelText: l10n(context).labelFoodContainerName,
                      maxLength: 50,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      validator: _validateFoodContainerName,
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
                      labelText: l10n(context).labelFoodContainerDescription,
                      maxLength: 100,
                      maxLines: 2,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        _weightFocusNode.requestFocus();
                      },
                      onChanged: (value) {
                        _onUserInteractionChange();
                      },
                    ),
                    const SizedBox(height: 8),
                    AmountInput(
                      label: l10n(context).labelFoodContainerWeight,
                      controller: _weightController,
                      focusNode: _weightFocusNode,
                      textInputAction: TextInputAction.done,
                      allowZero: false,
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
