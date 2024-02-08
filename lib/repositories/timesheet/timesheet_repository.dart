import 'package:saasify/data/models/timesheet/timesheet_attendance_history_model.dart';

abstract class TimeSheetRepository {
  Future<TimeSheetAttendanceHistoryModel> timeSheetAttendanceHistory();
}
