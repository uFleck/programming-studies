class Person {
  String name;
  String lastName;
  String email;
  int age;
  
  int calculateAgeInMonths() {
    return age * 12;
  }
  
  int calculateAgeInWeeks() {
    return age * 52;
  }
  
  int calculateAgeInDays() {
    return age * 365;
  }
  
  int calculateAgeInHours() {
    return age * 8766;
  }
  
  int calculateAgeInMinutes() {
    return age * 525960;
  }
  
  @override
  String toString() {
    return 'Person $name $lastName\nAge: $age\nE-mail: $email\nYour Age in...\nMonths: ${calculateAgeInMonths()}\nWeeks: ${calculateAgeInWeeks()}\nDays: ${calculateAgeInDays()}\nHours: ${calculateAgeInHours()}\nMinutes: ${calculateAgeInMinutes()}';
  }
}