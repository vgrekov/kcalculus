import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutritionRatioInput extends StatefulWidget {
  const NutritionRatioInput({
    super.key,
    required this.measure,
    this.estimatedTotalAmount,
    this.totalAmountController,
    this.totalAmountValidator,
    this.perAmountController,
    this.perAmountValidator,
    required this.enabled,
    required this.onToggleEnabled,
    this.onUserInteractionChange,
  });

  final Measure measure;

  final Amount? estimatedTotalAmount;

  final AmountInputController? totalAmountController;

  final String? Function(String?)? totalAmountValidator;

  final AmountInputController? perAmountController;

  final String? Function(String?)? perAmountValidator;

  final bool enabled;

  final void Function(Measure) onToggleEnabled;

  final void Function()? onUserInteractionChange;

  @override
  State<StatefulWidget> createState() {
    return _NutritionRatioInputState();
  }
}

class _NutritionRatioInputState extends State<NutritionRatioInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchListTile(
          value: widget.enabled,
          onChanged: (_) {
            widget.onToggleEnabled(widget.measure);
          },
          title: Text(
            widget.measure.localName(context),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (widget.enabled)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
              top: 0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.estimatedTotalAmount != null)
                  Row(
                    children: [
                      Text(
                        l10n(context).labelEstimatedTotal,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 8),
                      ActionChip(
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        label: Text(
                          l10n(context).statWithUnit(
                            nb.formatDouble(
                                context, widget.estimatedTotalAmount!.value),
                            widget.estimatedTotalAmount!.unit
                                .localName(context),
                          ),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        ),
                        onPressed: () {
                          widget.totalAmountController
                              ?.setAmount(widget.estimatedTotalAmount);

                          widget.onUserInteractionChange?.call();
                        },
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AmountInput(
                        controller: widget.totalAmountController,
                        label: l10n(context).labelTotal,
                        initialUnit: widget.totalAmountController?.unit,
                        initialValue: widget.totalAmountController?.value,
                        textInputAction: TextInputAction.next,
                        allowZero: false,
                        validator: widget.totalAmountValidator,
                        onUserInteractionChange: widget.onUserInteractionChange,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AmountInput(
                        controller: widget.perAmountController,
                        label: l10n(context).labelPer,
                        initialUnit: widget.perAmountController?.unit,
                        initialValue: widget.perAmountController?.value,
                        textInputAction: TextInputAction.next,
                        allowZero: false,
                        validator: widget.perAmountValidator,
                        onUserInteractionChange: widget.onUserInteractionChange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        const Divider(height: 0),
      ],
    );
  }
}
