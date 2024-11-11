import 'package:flutter/material.dart';
import 'package:kcalculus/models/amount.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;
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
  final bool allowZero;
  final bool enabled;
  final void Function(Amount?)? onSaveAmount;
  final FocusNode? focusNode;
  final bool autofocus;

  AmountInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.initialAmount,
    this.initialUnit,
    this.initialValue,
    this.fixedUnit = false,
    this.allowZero = true,
    this.enabled = true,
    this.onSaveAmount,
    this.focusNode,
    this.autofocus = false,
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
  late RegExp _valueMask;

  late Unit _unit;
  late double? _value;

  final TextEditingController _valueController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _unit = widget.initialUnit ?? widget.initialAmount?.unit ?? _defaultUnit;
    _value = widget.initialValue ?? widget.initialAmount?.value;

    if (widget.controller != null) {
      widget.controller!._unit = _unit;
      widget.controller!._value = _value;
      widget.controller!.addListener(_onControllerChange);
    }

    Future.delayed(Duration.zero, () {
      if (mounted) {
        _valueMask = RegExp(l10n(context).amounValueMask);
        _valueController.text =
            _value != null ? nb.formatDouble(context, _value!) : '';
      }
    });
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
      _valueController.text =
          _value != null ? nb.formatDouble(context, _value!) : '';
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
      return l10n(context).validationErrorAmountValueMissing;
    }

    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      return l10n(context).validationErrorAmountValueNaN;
    }

    if (widget.allowZero && doubleValue < 0) {
      return l10n(context).validationErrorAmountValueNegative;
    } else if (!widget.allowZero && doubleValue <= 0) {
      return l10n(context).validationErrorAmountValueNotPositive;
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

  void _applyMask(String value) {
    if (_valueMask.hasMatch(value)) {
      final match = _valueMask.stringMatch(value) ?? '';
      if (match != value) {
        _valueController.value = TextEditingValue(
          text: match,
          selection: TextSelection.collapsed(offset: match.length),
        );
      }
    } else {
      _valueController.clear();
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
              _unit.localName(context),
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
      onChanged: _applyMask,
      onSaved: _saveAmountValue,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
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
