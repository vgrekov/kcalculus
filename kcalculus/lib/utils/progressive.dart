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
          return Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: const Material(
                type: MaterialType.transparency,
                child: Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          );
        },
      );
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

  @override
  void dispose() {
    hideProgress();
    super.dispose();
  }
}
