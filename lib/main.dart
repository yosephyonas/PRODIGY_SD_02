import 'package:flutter/material.dart';
import 'package:guessing_game/login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Number Guessing Game',
      home: LoginPage(),
    );
  }
}

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
