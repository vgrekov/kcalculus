import 'package:flutter/material.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/widgets/amount_input/unit_picker.dart';

const _defaultUnit = Unit.gram;

class AmountInput extends StatefulWidget {
  final String? fieldName;
  final Amount? initialValue;
  final void Function(Amount?)? onSaveAmount;

  const AmountInput({
    super.key,
    this.fieldName,
    this.initialValue,
    this.onSaveAmount,
  });

  @override
  State<StatefulWidget> createState() {
    return _AmountInputState();
  }
}

class _AmountInputState extends State<AmountInput> {
  late Unit _unit;
  late double? _value;

  @override
  void initState() {
    _unit = widget.initialValue?.unit ?? _defaultUnit;
    _value = widget.initialValue?.value;
    super.initState();
  }

  void _pickUnit() async {
    final unit = await showDialog<Unit>(
      context: context,
      builder: (context) => UnitPicker(
        initialValue: _unit,
      ),
    );

    if (unit != null) {
      setState(() {
        _unit = unit;
      });
    }
  }

  String? _validateAmountValue(String? value) {
    if (value == null) {
      return 'Amount value is required';
    }

    final doubleValue = double.tryParse(value);
    if (doubleValue == null || doubleValue <= 0) {
      return 'Amount value must be a positive number';
    }

    return null;
  }

  void _saveAmountValue(String? value) {
    _value = double.tryParse(value!);
    if (widget.onSaveAmount != null) {
      widget.onSaveAmount!(
        _value == null ? null : Amount(unit: _unit, value: _value!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: widget.fieldName,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
            onPressed: _pickUnit,
            child: Text(
              _unit.displayName,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
            ),
          ),
        ),
        isDense: true,
      ),
      initialValue: _value?.toStringAsFixed(2),
      keyboardType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: true,
      ),
      validator: _validateAmountValue,
      onSaved: _saveAmountValue,
    );
  }
}
