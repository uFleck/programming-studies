class Fibonacci {
  int term1 = 0;
  int term2 = 1;
  int sum = 0;
  List sums = [];

  Stream<int> calculateSequence(int max) async* {
    while(term2 <= max) {
      await Future.delayed(const Duration(milliseconds: 500));
      sum = term1 + term2;
      term1= term2;
      term2 = sum;
      sums.add(sum);
      yield sum;
    }
  }
}