import 'package:flutter/material.dart';
import 'package:guessing_game/game_massages.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Guess_state.dart';
import 'controller.dart';
import 'hooks.dart';

final guessingGameProvider =
    StateNotifierProvider<GuessingGameController, GuessingGameState>(
  (ref) => GuessingGameController(),
);

class GuessingGamePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(guessingGameProvider.notifier).state;

    return MaterialApp(
      title: 'Number Guessing Game',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Guessing Game'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GuessingInput(),
                const SizedBox(height: 20),
                GuessingButton(),
                if (state.isGameOver) ...[
                  GameOverMessage(),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(guessingGameProvider.notifier).resetGame();
                    },
                    child: const Text('Restart'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
