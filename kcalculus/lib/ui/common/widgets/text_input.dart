import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool? enabled;

  const TextInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
  });

  String? _validate(BuildContext context, String? value) {
    if (maxLength != null && value != null && value.length > maxLength!) {
      return l10n(context).validationErrorMaxLengthExceeded;
    }

    if (validator != null) {
      return validator!(value);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .onSurfaceVariant
              .withValues(alpha: 0.5),
          fontWeight: FontWeight.normal,
        ),
        labelText: labelText,
        hintStyle: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .onSurfaceVariant
              .withValues(alpha: 0.5),
          fontWeight: FontWeight.normal,
        ),
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: suffix,
        isDense: true,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autocorrect: false,
      validator: (value) {
        return _validate(context, value);
      },
      onChanged: onChanged,
      onSaved: onSaved,
      focusNode: focusNode,
      autofocus: autofocus,
      enabled: enabled,
    );
  }
}
