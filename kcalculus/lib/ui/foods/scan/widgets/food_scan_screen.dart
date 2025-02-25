import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/foods/scan/view_models/food_scan_view_model.dart';
import 'package:kcalculus/ui/foods/scan/widgets/scanner.dart';
import 'package:kcalculus/ui/foods/scan/widgets/scanner_processing.dart';
import 'package:kcalculus/ui/foods/scan/widgets/scanner_try_again.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/messenger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class FoodScanScreen extends ConsumerStatefulWidget {
  const FoodScanScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FoodScanScreenState();
  }
}

class _FoodScanScreenState extends ConsumerState<FoodScanScreen>
    with StateMessenger, WidgetsBindingObserver {
  late final _assignments = <FoodScanCommand, UiAssignment>{
    FoodScanCommand.showCantReadNotification: _showCantReadNotification,
    FoodScanCommand.showVersionMismatchNotification:
        _showVersionMismatchNotification,
    FoodScanCommand.provideFood: _provideFood,
  };

  final _scannerController = MobileScannerController(
    autoStart: false,
  );

  StreamSubscription<Object?>? _scannerSubscription;

  bool _scannerStarted = false;

  Future<dynamic>? _scannerProcessor;

  String? _errorString;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _startScanner();

    _scannerStarted = true;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_scannerController.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        if (_scannerStarted) {
          _startScanner();
        }
      case AppLifecycleState.inactive:
        _stopScanner();
    }
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);

    _stopScanner();

    super.dispose();

    await _scannerController.dispose();
  }

  void _startScanner() {
    _scannerSubscription =
        _scannerController.barcodes.listen(_onBarcodeDetected);

    _scannerController.start();
  }

  void _stopScanner() {
    _scannerSubscription?.cancel();
    _scannerSubscription = null;

    _scannerController.stop();
  }

  void _onBarcodeDetected(BarcodeCapture barcodes) {
    final barcode = barcodes.barcodes.firstOrNull;
    if (barcode?.displayValue != null) {
      _stopScanner();

      setState(() {
        _scannerProcessor = ref
            .read(foodScanViewModel.notifier)
            .readFood(barcode!.displayValue!);
        _scannerStarted = false;
      });
    }
  }

  void _showCantReadNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    setState(() {
      _errorString = l10n(context).messageCantReadFoodFromBarcode;
    });
    command.complete();
  }

  void _showVersionMismatchNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    setState(() {
      _errorString = l10n(context).messageFoodFromBarcodeVersionMismatch;
    });
    command.complete();
  }

  void _provideFood(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    Navigator.of(context).pop(command.payload as Food);
    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(foodScanViewModel);

    final Widget content = Awaited(
      future: _scannerProcessor,
      loading: (_) => const ScannerProcessing(),
      error: (_, __, ___) => ScannerTryAgain(
        onTryAgain: () {
          _startScanner();
          setState(() {
            _scannerStarted = true;
            _errorString = null;
          });
        },
      ),
      data: (_, __) {
        if (_errorString == null) {
          return Scanner(
            controller: _scannerController,
          );
        } else {
          return ScannerTryAgain(
            onTryAgain: () {
              _startScanner();
              setState(() {
                _scannerStarted = true;
                _errorString = null;
              });
            },
          );
        }
      },
    );

    return UiSubordinate(
      commandProvider: ref.read(foodScanViewModel.notifier).commandProvider,
      assignments: _assignments,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: content,
                ),
                const SizedBox(height: 16),
                Text(
                  _errorString ?? '',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Theme.of(context).colorScheme.surfaceContainer,
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: 32,
              top: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    l10n(context).actionClose,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
