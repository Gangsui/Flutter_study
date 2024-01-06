import 'dart:math';

class HighScores {
  // Put your code her

  HighScores(this.scores);
  final List<int> scores;

  int latest() => scores[scores.length - 1];

  int personalBest() => scores.reduce((value, element) => max(value, element));

  List<int> personalTopThree() {
    final List<int> sortValue = List.from(scores);
    sortValue.sort();

    if (sortValue.length > 3) {
      return sortValue.sublist(sortValue.length - 3);
    } else {
      return sortValue;
    }
  }
}
