import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerError extends StatelessWidget {
  const ScannerError({
    super.key,
    required this.error,
  });

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.errorContainer,
      ),
      child: Center(
        child: Text(
          error.errorCode == MobileScannerErrorCode.permissionDenied
              ? l10n(context).messageNoCameraPermission
              : l10n(context).messageUnknownError,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
    );
  }
}
