class GuessingGameState {
  final int secretNumber;
  final int userGuess;
  final int attempts;
  final bool isGameOver;

  GuessingGameState({
    required this.secretNumber,
    required this.userGuess,
    required this.attempts,
    required this.isGameOver,
  });

  factory GuessingGameState.initial() {
    return GuessingGameState(
      secretNumber: 42,
      userGuess: 0,
      attempts: 0,
      isGameOver: false,
    );
  }

  GuessingGameState copyWith({
    int? secretNumber,
    int? userGuess,
    int? attempts,
    bool? isGameOver,
  }) {
    return GuessingGameState(
      secretNumber: secretNumber ?? this.secretNumber,
      userGuess: userGuess ?? this.userGuess,
      attempts: attempts ?? this.attempts,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}
