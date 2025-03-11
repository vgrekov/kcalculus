import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

enum MessageType {
  confirm,
  info,
  warning,
  error;

  String localName(BuildContext context) {
    return switch (this) {
      confirm => l10n(context).messageTypeConfirm,
      info => l10n(context).messageTypeInfo,
      warning => l10n(context).messageTypeWarning,
      error => l10n(context).messageTypeError,
    };
  }
}
