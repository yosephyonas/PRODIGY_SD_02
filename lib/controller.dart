import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guessing_game/Guess_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuessingGameController extends StateNotifier<GuessingGameState> {
  GuessingGameController() : super(GuessingGameState.initial()) {
    resetGame();
  }

  void makeGuess(BuildContext context) {
    state = state.copyWith(attempts: state.attempts + 1);

    if (state.userGuess == state.secretNumber) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Congratulations! You guessed the number in ${state.attempts} attempts!'),
          duration: Duration(seconds: 2),
        ),
      );
      resetGame();
    } else {
      userGuess = null;

      if (state.userGuess! < state.secretNumber) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Too low! Try again.'),
            duration: Duration(seconds: 1),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Too high! Try again.'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }
  }

  void showGameOverSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Congratulations! You guessed the number in ${state.attempts} attempts!',
        ),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Restart',
          onPressed: () {
            resetGame();
            ScaffoldMessenger.of(context).clearSnackBars();
          },
        ),
      ),
    );
  }

  set userGuess(int? value) {
    state = state.copyWith(userGuess: value);
  }

  void resetGame() {
    state = GuessingGameState.initial().copyWith(
      secretNumber: Random().nextInt(100) + 1,
    );
  }
}
