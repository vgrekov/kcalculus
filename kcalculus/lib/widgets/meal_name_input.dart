import 'package:flutter/material.dart';

class MealNameInput extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onSearchPressed;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool autofocus;

  const MealNameInput({
    super.key,
    this.controller,
    this.onSearchPressed,
    this.onSaved,
    this.focusNode,
    this.autofocus = false,
  });

  String? _validateMealName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
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
        labelText: 'Name',
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
      validator: _validateMealName,
      onSaved: onSaved,
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }
}
