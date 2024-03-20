import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_theme.dart';

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}

RichText formatAmount(double amount, BuildContext context, {int? count}) {
  return RichText(
      text: TextSpan(
          text: '₹ ',
          style: Theme.of(context).textTheme.descriptionTextStyle,
          children: <TextSpan>[
        TextSpan(
            text: amount.toStringAsFixed(2),
            style: Theme.of(context).textTheme.subtotalCostTextStyle)
      ]));
}

Color getColorFromStatus(String text) {
  switch (text) {
    case '2':
    case 'REJECTED':
      return AppColors.errorRed;
    case '1':
    case 'APPROVED':
      return AppColors.successGreen;
    case '3':
    case 'PENDING':
      return AppColors.lightBlue;
    default:
      return Colors.grey;
  }
}

Color getTaskColorFromStatus(String text) {
  switch (text) {
    case 'CLOSED':
      return AppColors.errorRed;
    case 'DONE':
      return AppColors.successGreen;
    case 'PENDING':
      return AppColors.lightBlue;
    default:
      return Colors.grey;
  }
}

Color getTaskColorFromPriority(String text) {
  switch (text) {
    case '0':
      return AppColors.errorRed;
    case '2':
      return AppColors.successGreen;
    case '1':
      return AppColors.lightBlue;
    default:
      return Colors.grey;
  }
}

String getPriorityFromInt(String priority) {
  switch (priority) {
    case '0':
      return 'HIGH';
    case '1':
      return 'MEDIUM';
    case '2':
      return 'LOW';
    default:
      return 'HIGH';
  }
}
