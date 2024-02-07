import 'package:saasify/data/models/timesheet/timesheet_attendance_history_model.dart';

abstract class TimeSheetStates {}

class TimeSheetInitialise extends TimeSheetStates {}

class FetchingTimeSheetAttendanceHistory extends TimeSheetStates {}

class TimeSheetAttendanceHistoryFetched extends TimeSheetStates {
  final TimeSheetAttendanceHistoryModel timeSheetAttendanceHistoryModel;

  TimeSheetAttendanceHistoryFetched({required this.timeSheetAttendanceHistoryModel});
}

class TimeSheetAttendanceHistoryNotFetched extends TimeSheetStates {
  final String? message;

  TimeSheetAttendanceHistoryNotFetched({this.message});
}
