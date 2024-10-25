import 'package:flutter/material.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/widgets/amount_input/unit_picker.dart';

const _defaultUnit = Unit.gram;

class AmountInput extends StatefulWidget {
  final AmountInputController? controller;
  final String? label;
  final String? hint;
  final Amount? initialAmount;
  final Unit? initialUnit;
  final double? initialValue;
  final bool fixedUnit;
  final bool enabled;
  final void Function(Amount?)? onSaveAmount;

  AmountInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.initialAmount,
    this.initialUnit,
    this.initialValue,
    this.fixedUnit = false,
    this.enabled = true,
    this.onSaveAmount,
  }) {
    if (fixedUnit && initialUnit == null && initialAmount == null) {
      throw 'When fixed, a unit must be provided.';
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _AmountInputState();
  }
}

class _AmountInputState extends State<AmountInput> {
  late Unit _unit;
  late double? _value;

  late TextEditingController _valueController;

  @override
  void initState() {
    _unit = widget.initialUnit ?? widget.initialAmount?.unit ?? _defaultUnit;
    _value = widget.initialValue ?? widget.initialAmount?.value;
    _valueController = TextEditingController(text: _value?.toString());

    if (widget.controller != null) {
      widget.controller!._unit = _unit;
      widget.controller!._value = _value;
      widget.controller!.addListener(_onControllerChange);
    }

    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChange);
    _valueController.dispose();

    super.dispose();
  }

  void _onControllerChange() {
    setState(() {
      _unit = widget.controller!._unit ?? _unit;
      _value = widget.controller!._value;
      _valueController.text = _value?.toString() ?? '';
    });
  }

  void _pickUnit() async {
    final unit = await showDialog<Unit>(
      context: context,
      builder: (context) => UnitPicker(
        initialValue: _unit,
      ),
    );

    if (unit != null) {
      if (widget.controller != null) {
        widget.controller!._unit = unit;
      }

      setState(() {
        _unit = unit;
      });
    }
  }

  String? _validateAmountValue(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount value is required';
    }

    final doubleValue = double.tryParse(value);
    if (doubleValue == null || doubleValue < 0) {
      return 'Amount value can not be a negative number';
    }

    return null;
  }

  void _saveAmountValue(String? value) {
    _value = double.tryParse(value!);

    if (widget.controller != null) {
      widget.controller!._value = _value;
    }

    if (widget.onSaveAmount != null) {
      widget.onSaveAmount!(
        _value == null ? null : Amount(unit: _unit, value: _value!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _valueController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          fontWeight: FontWeight.normal,
        ),
        labelText: widget.label,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          fontWeight: FontWeight.normal,
        ),
        hintText: widget.hint,
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
            onPressed: widget.fixedUnit ? null : _pickUnit,
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
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      enabled: widget.enabled,
      keyboardType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: true,
      ),
      validator: _validateAmountValue,
      onSaved: _saveAmountValue,
    );
  }
}

class AmountInputController extends ChangeNotifier {
  Unit? _unit;
  double? _value;

  void setUnit(Unit unit) {
    _unit = unit;
    notifyListeners();
  }

  void setValue(double? value) {
    _value = value;
    notifyListeners();
  }

  void setAmount(Amount? amount) {
    _unit = amount?.unit;
    _value = amount?.value;
    notifyListeners();
  }
}
