import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'GuessingGamePage.dart';
import 'controller.dart';

class GuessingInput extends ConsumerWidget {
  const GuessingInput({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final controller = ref.read(guessingGameProvider.notifier);
    return _buildInput(context, controller);
  }

  Widget _buildInput(BuildContext context, GuessingGameController controller) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        controller.userGuess = int.tryParse(value);
      },
      style: const TextStyle(fontSize: 18),
      decoration: const InputDecoration(
        labelText: 'Enter your guess',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class GuessingButton extends ConsumerWidget {
  const GuessingButton({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final controller = ref.read(guessingGameProvider.notifier);
    return _buildButton(context, controller);
  }

  Widget _buildButton(BuildContext context, GuessingGameController controller) {
    return ElevatedButton(
      onPressed: () {
        controller.makeGuess(context);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: const Text('Submit Guess'),
    );
  }
}
