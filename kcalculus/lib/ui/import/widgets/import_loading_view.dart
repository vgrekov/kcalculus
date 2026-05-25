import 'package:flutter/material.dart';

class ImportLoadingView extends StatelessWidget {
  const ImportLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
