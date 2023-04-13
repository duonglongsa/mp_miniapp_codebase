class Utils {
  static String getDateString(DateTime dateTime) {
    return "${dateTime.day ~/ 10}${dateTime.day % 10}/${dateTime.month ~/ 10}${dateTime.month % 10}/${dateTime.year}";
  }
}
