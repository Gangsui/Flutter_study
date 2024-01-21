import 'dart:math';

class DifferenceOfSquares {
  // Put your code here
  int squareSum = 0;
  int sumSquare = 0;

  int squareOfSum(value) {
    for (int i = 1; i <= value; i++) {
      squareSum += i;
    }

    return pow(squareSum, 2).toInt();
  }

  int sumOfSquares(value) {
    for (int i = 1; i <= value; i++) {
      sumSquare += pow(i, 2).toInt();
    }

    return sumSquare;
  }

  int differenceOfSquares(value) {
    squareOfSum(value);
    sumOfSquares(value);
    return squareSum - sumSquare;
  }
}
