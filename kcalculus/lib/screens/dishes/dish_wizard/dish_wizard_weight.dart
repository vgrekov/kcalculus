import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:kcalculus/utils/number.dart' as nb;
import 'package:kcalculus/widgets/amount_input/amount_input.dart';

class DishWizardWeightPage extends ConsumerStatefulWidget {
  const DishWizardWeightPage({super.key});

  @override
  ConsumerState<DishWizardWeightPage> createState() {
    return _DishWizardWeightPageState();
  }
}

class _DishWizardWeightPageState extends ConsumerState<DishWizardWeightPage>
    with StateMessenger
    implements DishWizardPage {
  final _form = GlobalKey<FormState>();

  @override
  bool validate(BuildContext context, WidgetRef ref) {
    final wizardState = ref.read(dishWizardProvider).data;

    if (wizardState.weightType == null) {
      showNotification(l10n(context).messageDishSelectWeightOptionError);
      return false;
    }

    switch (wizardState.weightType!) {
      case DishWeightType.calculated:
        final calculatedWeightInGrams = wizardState.calculateWeightInGrams();
        if (calculatedWeightInGrams <= 0) {
          showNotification(l10n(context).messageDishCantCalculateWeight);
          return false;
        }
        break;
      case DishWeightType.entered:
        return _form.currentState!.validate();
    }

    return true;
  }

  @override
  void save(BuildContext context, WidgetRef ref) {
    final wizardState = ref.read(dishWizardProvider).data;

    if (wizardState.weightType == DishWeightType.entered) {
      _form.currentState!.save();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void _changeWeightType(DishWeightType? weightType) {
    ref.read(dishWizardProvider.notifier).setWeightType(weightType);
  }

  void _saveEnteredWeight(Amount? amount) {
    ref.read(dishWizardProvider.notifier).setWeightInGrams(amount?.value);
  }

  @override
  ScaffoldConfig? buildScaffoldConfig(BuildContext context, WidgetRef ref) {
    return ScaffoldConfig(
      subtitle: l10n(context).dishWizardPageWeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    final wizardState = ref.watch(dishWizardProvider).data;
    final calculatedWeightInGrams = wizardState.calculateWeightInGrams();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<DishWeightType>(
            value: DishWeightType.calculated,
            groupValue: wizardState.weightType,
            onChanged: _changeWeightType,
            title: Row(
              children: [
                Text(
                  l10n(context).labelWeightOptionCalculated,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n(context).statWithUnit(
                      nb.formatDouble(context, calculatedWeightInGrams),
                      Unit.gram.localName(context),
                    ),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          RadioListTile<DishWeightType>(
            value: DishWeightType.entered,
            groupValue: wizardState.weightType,
            onChanged: _changeWeightType,
            title: Text(
              l10n(context).labelWeightOptionManual,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: AmountInput(
                label: l10n(context).labelWeight,
                initialUnit: Unit.gram,
                initialValue: wizardState.weightInGrams,
                fixedUnit: true,
                textInputAction: TextInputAction.next,
                onSaveAmount: _saveEnteredWeight,
                enabled: wizardState.weightType == DishWeightType.entered,
                allowZero: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
