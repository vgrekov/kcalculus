import 'package:flutter/material.dart';
import 'package:kcalculus/ui/foods/scan/widgets/scanner_error.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatelessWidget {
  const Scanner({
    super.key,
    required this.controller,
  });

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: MobileScanner(
          controller: controller,
          errorBuilder: (context, error, widget) {
            return ScannerError(error: error);
          },
        ),
      ),
    );
  }
}
