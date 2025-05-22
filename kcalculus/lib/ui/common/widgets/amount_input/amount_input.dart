import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/unit_picker.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

const _defaultUnit = Unit.gram;

class AmountInput extends StatefulWidget {
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
    this.textInputAction,
    this.onFieldSubmitted,
    this.onSaveAmount,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.onUserInteractionChange,
    this.fixedMeasure,
  }) {
    if (fixedUnit && initialUnit == null && initialAmount == null) {
      throw 'When fixed, a unit must be provided.';
    }

    if (fixedMeasure != null) {
      final unit = initialUnit ??
          initialAmount?.unit ??
          controller?._unit ??
          _defaultUnit;
      if (unit.measure != fixedMeasure) {
        throw 'A fixed measure is incompatible with the unit.';
      }
    }
  }

  final AmountInputController? controller;

  final String? label;

  final String? hint;

  final Amount? initialAmount;

  final Unit? initialUnit;

  final double? initialValue;

  final bool fixedUnit;

  final bool allowZero;

  final bool enabled;

  final TextInputAction? textInputAction;

  final void Function(String)? onFieldSubmitted;

  final void Function(Amount?)? onSaveAmount;

  final FocusNode? focusNode;

  final bool autofocus;

  final String? Function(String?)? validator;

  final void Function()? onUserInteractionChange;

  final Measure? fixedMeasure;

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

    _unit = widget.initialUnit ??
        widget.initialAmount?.unit ??
        widget.controller?._unit ??
        _defaultUnit;

    _value = widget.initialValue ??
        widget.initialAmount?.value ??
        widget.controller?._value;

    widget.controller?.addListener(_onControllerChange);

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
        fixedMeasure: widget.fixedMeasure,
      ),
    );

    if (unit != null && unit != _unit) {
      if (widget.controller != null) {
        widget.controller!._unit = unit;
      }

      widget.onUserInteractionChange?.call();

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

    return widget.validator != null ? widget.validator!(value) : null;
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
    bool hasChanges = false;

    if (_valueMask.hasMatch(value)) {
      final match = _valueMask.stringMatch(value) ?? '';
      if (match != value) {
        _valueController.value = TextEditingValue(
          text: match,
          selection: TextSelection.collapsed(offset: match.length),
        );
      }

      final newValue = double.tryParse(match);
      if (newValue != _value) {
        hasChanges = true;
      }
    } else {
      _valueController.clear();

      if (_value != null) {
        hasChanges = true;
      }
    }

    if (hasChanges) {
      widget.onUserInteractionChange?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: _valueController,
      labelText: widget.label,
      hintText: widget.hint,
      suffix: Padding(
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
      enabled: widget.enabled,
      keyboardType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: true,
      ),
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
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

  Unit? get unit => _unit;

  void setUnit(Unit? unit) {
    _unit = unit;
    notifyListeners();
  }

  double? get value => _value;

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
