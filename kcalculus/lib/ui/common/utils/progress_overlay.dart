import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressOverlay {
  static Future<R> wrap<R>(
    BuildContext context,
    Future<R> future,
  ) async {
    final progress = ProgressOverlay();

    progress.show(context);

    try {
      return await future;
    } finally {
      progress.hide();
    }
  }

  OverlayEntry? _overlay;

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        opaque: false,
        maintainState: true,
        builder: (context) {
          return Stack(
            children: [
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 2,
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              const Positioned.fill(
                child: ModalBarrier(
                  dismissible: false,
                ),
              ),
            ],
          );
        },
      );
      FocusManager.instance.primaryFocus?.unfocus();
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay!.dispose();
      _overlay = null;
    }
  }
}
