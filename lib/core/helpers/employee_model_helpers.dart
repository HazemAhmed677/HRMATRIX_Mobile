import 'package:intl/intl.dart';

String convertTimeStmpToDate(String timeStmp) {
  try {
    final DateTime parsedDate = DateTime.parse(timeStmp);
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  } catch (e) {
    return 'Invalid date';
  }
}

String calculateEmploymentPeriod(String start, String end) {
  try {
    final DateTime startDate = DateTime.parse(start);
    final DateTime endDate = DateTime.parse(end);
    final Duration diff = endDate.difference(startDate);

    final int totalDays = diff.inDays;
    final int months = totalDays ~/ 30;
    final int days = totalDays % 30;

    return '$months month${months != 1 ? 's' : ''}, $days day${days != 1 ? 's' : ''}';
  } catch (e) {
    return '-';
  }
}

String formatBirthDate(String birthDate) {
  DateTime parsedDate = DateTime.parse(birthDate);
  String formattedDate =
      "${parsedDate.day.toString().padLeft(2, '0')}//${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.year}";
  return formattedDate;
}

int calculateAge(String birthDateString) {
  DateTime birthDate = DateTime.parse(birthDateString);
  DateTime today = DateTime.now();

  int age = today.year - birthDate.year;

  // Adjust if birth date hasn't occurred yet this year
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  return age;
}
