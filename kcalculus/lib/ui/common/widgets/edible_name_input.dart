import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/widgets/premium_badge.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/utils/l10n.dart';

class EdibleNameInput extends StatelessWidget {
  const EdibleNameInput({
    super.key,
    this.controller,
    this.textInputAction,
    this.onScanPressed,
    this.onSearchPressed,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
  });

  final TextEditingController? controller;

  final TextInputAction? textInputAction;

  final void Function()? onScanPressed;

  final void Function()? onSearchPressed;

  final void Function(String)? onFieldSubmitted;

  final void Function(String?)? onSaved;

  final FocusNode? focusNode;

  final bool autofocus;

  final bool enabled;

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
      prefix: IconButton(
        onPressed: onScanPressed,
        icon: PremiumBadge(
          child: Icon(
            Icons.qr_code_scanner,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      suffix: IconButton(
        onPressed: onSearchPressed,
        icon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      maxLength: 50,
      textCapitalization: TextCapitalization.words,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) => _validateName(context, value),
      onSaved: onSaved,
      focusNode: focusNode,
      autofocus: autofocus,
      enabled: enabled,
    );
  }
}
