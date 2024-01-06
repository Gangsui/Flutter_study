class ArmstrongNumbers {
  ArmstrongNumbers({required this.value});
  double value;

  bool isPrime() {
    if (value == 0) {
      return false;
    }
    for (int i = 2; i < value / 2; i++) {
      if (value % i == 0) {
        return false;
      }
    }
    return true;
  }
}
