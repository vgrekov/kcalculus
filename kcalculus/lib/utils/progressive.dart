import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

mixin ProgressiveState<T extends StatefulWidget> on State<T> {
  OverlayEntry? _progressOverlay;

  void showProgress() {
    if (_progressOverlay == null && mounted) {
      _progressOverlay = OverlayEntry(
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
      Overlay.of(context).insert(_progressOverlay!);
    }
  }

  void hideProgress() {
    if (_progressOverlay != null) {
      _progressOverlay!.remove();
      _progressOverlay!.dispose();
      _progressOverlay = null;
    }
  }

  Future<R> wrapInProgress<R>(Future<R> future) async {
    showProgress();

    try {
      return await future;
    } finally {
      hideProgress();
    }
  }

  @override
  void dispose() {
    hideProgress();
    super.dispose();
  }
}
