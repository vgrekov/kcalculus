import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_main_step_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_ui_state.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class DishWizardMainPage extends ConsumerStatefulWidget {
  const DishWizardMainPage({
    super.key,
    this.dish,
    required this.pageController,
  });

  final Dish? dish;

  final PageController pageController;

  @override
  ConsumerState<DishWizardMainPage> createState() {
    return _DishWizardMainPageState();
  }
}

class _DishWizardMainPageState extends ConsumerState<DishWizardMainPage>
    implements DishWizardPage {
  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  late FocusNode _nameFocusNode;
  late FocusNode _descriptionFocusNode;

  MainStepValidationResult? _stateValidationResult;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();

    final uiState = ref.read(dishWizardViewModel(widget.dish));
    _loadUiState(uiState);

    super.initState();
  }

  void _loadUiState(DishWizardUiState uiState) {
    _nameController.text = uiState.mainStepState.name;
    _descriptionController.text = uiState.mainStepState.description;
  }

  @override
  bool validate(BuildContext context, WidgetRef ref) {
    _stateValidationResult =
        ref.read(dishWizardViewModel(widget.dish)).mainStepState.validate();
    return _form.currentState!.validate();
  }

  @override
  void save(BuildContext context, WidgetRef ref) {
    _form.currentState!.save();
    FocusManager.instance.primaryFocus?.unfocus();

    ref.read(dishWizardViewModel(widget.dish).notifier).updateMainStepState(
          name: _nameController.text,
          description: _descriptionController.text,
        );
  }

  String? _validateFoodName(String? value) {
    if (_stateValidationResult == MainStepValidationResult.nameMissing) {
      return l10n(context).validationErrorEdibleNameMissing;
    }

    return null;
  }

  void _onUserInteractionChange(String input) {
    ref
        .read(dishWizardViewModel(widget.dish).notifier)
        .onUserInteractionChange();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();

    _nameFocusNode.dispose();
    _descriptionFocusNode.dispose();

    super.dispose();
  }

  @override
  ScaffoldConfig? buildScaffoldConfig(BuildContext context, WidgetRef ref) {
    return ScaffoldConfig(
      subtitle: l10n(context).dishWizardPageMain,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dishWizardViewModel(widget.dish), (prev, next) {
      _loadUiState(next);
    });

    return SingleChildScrollView(
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
                labelText: l10n(context).labelEdibleName,
                maxLength: 50,
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                validator: _validateFoodName,
                onFieldSubmitted: (value) {
                  _descriptionFocusNode.requestFocus();
                },
                onChanged: _onUserInteractionChange,
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
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                onChanged: _onUserInteractionChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
