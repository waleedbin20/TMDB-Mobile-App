class FormattedMonthGenerator {
  static const List<String> _monthNames = [
    "",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String getFormattedDate(String date) {
    // Split the date string into year, month, and day parts
    List<String> parts = date.split("-");
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    // Get the name of the month
    String monthName = _monthNames[month];

    // Return the formatted date string
    return "$monthName $day, $year";
  }
}
