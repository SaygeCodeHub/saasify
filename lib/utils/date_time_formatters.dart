import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final formatter = DateFormat("d'${_suffix(date.day)}' MMMM yyyy");
  return formatter.format(date);
}

String formatTime(DateTime time) {
  final formatter = DateFormat("hh:mm:ss a");
  return formatter.format(time);
}

String _suffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
