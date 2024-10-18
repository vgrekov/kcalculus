import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/screens/daily_log.dart';
import 'package:kcalculus/themes/dark.dart' as dark;

void main() {
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark.theme,
      home: const DailyLogScreen(),
    );
  }
}
