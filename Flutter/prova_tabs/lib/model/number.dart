import 'dart:math';

class Number {
  var randomNumber = new Random();

  generateRandomNumber() {
    return randomNumber.nextInt(10);
  }
}