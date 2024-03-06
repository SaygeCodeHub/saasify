import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_dimensions.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime firstDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    DateTime lastDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 1);

    return TableCalendar(
      headerStyle: const HeaderStyle(
          titleTextStyle: TextStyle(fontSize: 20),
          formatButtonVisible: false,
          leftChevronIcon:
              Icon(Icons.arrow_back_ios, color: Colors.transparent),
          rightChevronIcon:
              Icon(Icons.arrow_forward_ios, color: Colors.transparent)),
      locale: "en_US",
      rowHeight: 100,
      daysOfWeekHeight: 100,
      focusedDay: today,
      firstDay: firstDayOfMonth,
      lastDay: lastDayOfMonth,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        defaultTextStyle: const TextStyle(color: AppColors.black),
        weekendTextStyle: const TextStyle(color: Colors.red),
        tableBorder: TableBorder.all(
          color: AppColors.lighterBlack,
          width: 0.5,
          borderRadius: BorderRadius.circular(kCardRadius),
        ),
      ),
    );
  }
}
