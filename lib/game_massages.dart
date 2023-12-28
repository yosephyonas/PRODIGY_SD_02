import 'package:flutter/material.dart';
import 'package:guessing_game/GuessingGamePage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameOverMessage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(guessingGameProvider);
    return Text(
      'Congratulations! You guessed the number ${state.secretNumber} in ${state.attempts} attempts.',
      textAlign: TextAlign.center,
    );
  }
}
