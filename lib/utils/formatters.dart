import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_colors.dart';

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}

Color getColorFromStatus(String text) {
  switch (text) {
    case '2':
    case 'REJECTED':
      return AppColors.errorRed;
    case '1':
    case 'ACCEPTED':
      return AppColors.successGreen;
    case '3':
    case 'PENDING':
      return AppColors.lightBlue;
    default:
      return AppColors.lightGrey;
  }
}

String getPriorityFromInt(String priority) {
  switch (priority) {
    case '2':
      return 'High';
    case '1':
      return 'Medium';
    case '0':
      return 'Low';
    default:
      return 'High';
  }
}
