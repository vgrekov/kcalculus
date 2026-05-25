import 'package:flutter/material.dart';
import 'package:kcalculus/utils/email_validator.dart';
import 'package:kcalculus/utils/l10n.dart';

class EmailInput extends StatelessWidget {
  EmailInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.required = true,
    this.showCounter = true,
  }) : _emailValidator = EmailValidator();

  final TextEditingController? controller;

  final String? labelText;

  final String? hintText;

  final TextInputAction? textInputAction;

  final String? Function(String?)? validator;

  final void Function(String)? onChanged;

  final void Function(String)? onFieldSubmitted;

  final void Function(String?)? onSaved;

  final FocusNode? focusNode;

  final bool autofocus;

  final bool? enabled;

  final bool required;

  final EmailValidator _emailValidator;

  final bool showCounter;

  String? _validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return required ? l10n(context).validationErrorEmailRequired : null;
    }

    if (!_emailValidator.isValidEmail(value)) {
      return l10n(context).validationErrorEmailInvalid;
    }

    if (validator != null) {
      return validator!(value);
    }

    return null;
  }

  Widget? _noCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) =>
      null;

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
        isDense: true,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      buildCounter: showCounter ? null : _noCounter,
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      maxLength: 254,
      textCapitalization: TextCapitalization.none,
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
