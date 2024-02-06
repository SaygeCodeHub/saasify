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
    case 'REJECTED':
      return AppColors.errorRed;
    case 'ACCEPTED':
      return AppColors.successGreen;
    case 'PENDING':
      return AppColors.lightBlue;
    default:
      return AppColors.lightGrey;
  }
}
