import 'package:flutter/material.dart';

class Inattentive extends StatelessWidget {
  final Widget child;

  const Inattentive({
    super.key,
    required this.child,
  });

  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      child: child,
    );
  }
}
