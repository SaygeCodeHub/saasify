import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardCalendar extends StatefulWidget {
  const DashboardCalendar({
    super.key,
  });

  @override
  State<DashboardCalendar> createState() => _DashboardCalendarState();
}

class _DashboardCalendarState extends State<DashboardCalendar> {
  DateTime _focusDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        onDaySelected: (selectedDate, event) {
          setState(() {
            _focusDay = selectedDate;
          });
        },
        selectedDayPredicate: (selectedDate) {
          return selectedDate == _focusDay;
        },
        focusedDay: _focusDay,
        firstDay: DateTime(1900),
        lastDay: DateTime(2100),
        calendarFormat: CalendarFormat.week,
        availableCalendarFormats: const {CalendarFormat.week: 'Week'});
  }
}
