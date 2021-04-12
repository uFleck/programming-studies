class Student {
  String name, lastName;
  double grade1, grade2;

  Student(this.name, this.lastName, this.grade1, this.grade2);

  double calculateAverage() {
    return (grade1 + grade2) / 2;
  }

  @override
  String toString() {
    return 'Name: ${this.name.toUpperCase()}\nLast name: ${this.lastName.toUpperCase()}\nAverage: ${calculateAverage()}';
  }
}
