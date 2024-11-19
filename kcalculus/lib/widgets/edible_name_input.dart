import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/text_input.dart';

class EdibleNameInput extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onSearchPressed;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool enabled;

  const EdibleNameInput({
    super.key,
    this.controller,
    this.onSearchPressed,
    this.onSaved,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
  });

  String? _validateName(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n(context).validationErrorEdibleNameMissing;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: controller,
      labelText: l10n(context).labelEdibleName,
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
          onPressed: onSearchPressed,
          child: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
      ),
      maxLength: 50,
      textCapitalization: TextCapitalization.words,
      validator: (value) => _validateName(context, value),
      onSaved: onSaved,
      focusNode: focusNode,
      autofocus: autofocus,
      enabled: enabled,
    );
  }
}
