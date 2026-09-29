import 'package:flutter/material.dart';

class SubscriptionLoadingView extends StatelessWidget {
  const SubscriptionLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
