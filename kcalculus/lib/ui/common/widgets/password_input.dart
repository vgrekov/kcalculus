import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/password_validator.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    required this.minLength,
    required this.maxLength,
    this.uppercaseLetters = true,
    this.lowercaseLetters = true,
    this.digits = true,
    this.specialCharacters = true,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.required = true,
  }) : _passwordValidator = PasswordValidator(
          minLength: minLength,
          maxLength: maxLength,
          uppercaseLetters: uppercaseLetters,
          lowercaseLetters: lowercaseLetters,
          digits: digits,
          specialCharacters: specialCharacters,
        );

  final TextEditingController? controller;

  final String? labelText;

  final String? hintText;

  final int minLength;

  final int maxLength;

  final bool uppercaseLetters;

  final bool lowercaseLetters;

  final bool digits;

  final bool specialCharacters;

  final TextInputAction? textInputAction;

  final String? Function(String?)? validator;

  final void Function(String)? onChanged;

  final void Function(String)? onFieldSubmitted;

  final void Function(String?)? onSaved;

  final FocusNode? focusNode;

  final bool autofocus;

  final bool? enabled;

  final bool required;

  final PasswordValidator _passwordValidator;

  @override
  State<StatefulWidget> createState() {
    return _PasswordInputState();
  }
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return widget.required
          ? l10n(context).validationErrorPasswordRequired
          : null;
    }

    if (!widget._passwordValidator.isValidPassword(value)) {
      return l10n(context).validationErrorPasswordInvalid(
        widget.minLength,
        widget.maxLength,
        widget.uppercaseLetters.toString(),
        widget.lowercaseLetters.toString(),
        widget.digits.toString(),
        widget.specialCharacters.toString(),
      );
    }

    if (widget.validator != null) {
      return widget.validator!(value);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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
        labelText: widget.labelText,
        hintStyle: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .onSurfaceVariant
              .withValues(alpha: 0.5),
          fontWeight: FontWeight.normal,
        ),
        hintText: widget.hintText ??
            l10n(context).hintPassword(
              widget.minLength,
              widget.maxLength,
              widget.uppercaseLetters.toString(),
              widget.lowercaseLetters.toString(),
              widget.digits.toString(),
              widget.specialCharacters.toString(),
            ),
        suffixIcon: IconButton(
          onPressed: _toggleObscureText,
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        isDense: true,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      obscureText: _obscureText,
      keyboardType: TextInputType.text,
      maxLength: widget.maxLength,
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      autocorrect: false,
      validator: (value) {
        return _validate(context, value);
      },
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
    );
  }
}
