import 'dart:math';

class LoveCalculator {
  String firstName;
  String secondName;

  LoveCalculator(this.firstName, this.secondName);


  String generateLovePercent() {
    var random = new Random();
    int randomNumber = random.nextInt(100);
    var output;
    int percentage = randomNumber;


    if(randomNumber >= 90) {
      output = 'Tá destinado já.';
    } else if(randomNumber >= 75) {
      output = 'São belos juntos.';
    } else if(randomNumber >= 50) {
      output = 'Combinam mais ou menos.';
    } else if(randomNumber >= 35) {
      output = 'Ainda tem chance...';
    } else {
      output = 'Vish...';
    }

    return 'A compatibilidade entre $firstName e $secondName é de: $percentage%.\n$output';
  }
}