import 'package:saasify/data/models/timesheet/timesheet_attendance_history_model.dart';

abstract class TimeSheetStates {}

class TimeSheetInitialise extends TimeSheetStates {}

class FetchingTimesheet extends TimeSheetStates {}

class TimesheetFetched extends TimeSheetStates {
  final TimesheetModel timesheetModel;

  TimesheetFetched({required this.timesheetModel});
}

class FetchTimesheetError extends TimeSheetStates {
  final String message;

  FetchTimesheetError({required this.message});
}
