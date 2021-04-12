class Calculator {
  double number1, number2;

  Calculator(this.number1, this.number2);

  double calculateSum() {
    return number1 + number2;
  }

  double calculateSubtraction() {
    return number1 - number2;
  }

  double calculateDivision() {
    return number1 / number2;
  }

  double calculateMultiplication() {
    return number1 * number2;
  }

  String toString() {
    return 'First Number: $number1\nSecond Number: $number2\nSum: ${calculateSum()}\nSubtraction: ${calculateSubtraction()}\nDivision: ${calculateDivision()}\nMultiplication: ${calculateMultiplication()}';
  }
}
