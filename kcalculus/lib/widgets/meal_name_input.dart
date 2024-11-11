import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

class MealNameInput extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onSearchPressed;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool enabled;

  const MealNameInput({
    super.key,
    this.controller,
    this.onSearchPressed,
    this.onSaved,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
  });

  String? _validateMealName(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n(context).validationErrorMealNameMissing;
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
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          fontWeight: FontWeight.normal,
        ),
        labelText: l10n(context).labelMealName,
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
            onPressed: onSearchPressed,
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            ),
          ),
        ),
        isDense: true,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      maxLength: 50,
      textCapitalization: TextCapitalization.words,
      validator: (value) => _validateMealName(context, value),
      onSaved: onSaved,
      focusNode: focusNode,
      autofocus: autofocus,
      enabled: enabled,
    );
  }
}
