class AppFunctions {
  static int getDate(DateTime date) {
    final int data = date.year;
    int age = DateTime.now().year - data;

    if (date.day > DateTime.now().day && date.month == DateTime.now().month) {
      age--;
    }
    return age;
  }
}
