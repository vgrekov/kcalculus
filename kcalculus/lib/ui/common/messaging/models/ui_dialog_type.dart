import 'package:kcalculus/l10n/app_localizations.dart';

enum UiDialogType {
  confirm,
  info,
  warning,
  error;

  String localName(AppLocalizations l10n) {
    return switch (this) {
      confirm => l10n.messageTypeConfirm,
      info => l10n.messageTypeInfo,
      warning => l10n.messageTypeWarning,
      error => l10n.messageTypeError,
    };
  }
}
