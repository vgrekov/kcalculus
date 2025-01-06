import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/text_input.dart';

class DishWizardMainPage extends ConsumerStatefulWidget {
  final PageController pageController;

  const DishWizardMainPage({
    super.key,
    required this.pageController,
  });

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

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();

    super.initState();
  }

  @override
  bool validate(BuildContext context, WidgetRef ref) {
    return _form.currentState!.validate();
  }

  @override
  void save(BuildContext context, WidgetRef ref) {
    _form.currentState!.save();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  String? _validateFoodName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n(context).validationErrorEdibleNameMissing;
    }

    return null;
  }

  void _saveName(String? value) {
    ref.read(dishWizardProvider.notifier).setName(value!);
  }

  void _saveDescription(String? value) {
    ref.read(dishWizardProvider.notifier).setDescription(value!);
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
    final wizardState = ref.watch(dishWizardProvider).data;

    _nameController.text = wizardState.name ?? '';
    _descriptionController.text = wizardState.description ?? '';

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
                onSaved: _saveName,
              ),
              const SizedBox(height: 8),
              TextInput(
                controller: _descriptionController,
                labelText: l10n(context).labelEdibleDescription,
                hintText: l10n(context).hintEdibleDescription,
                maxLength: 100,
                maxLines: 2,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                onSaved: _saveDescription,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
