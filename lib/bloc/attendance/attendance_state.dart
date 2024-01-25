abstract class AttendanceStates {}

class AttendanceInitial extends AttendanceStates {}

class MarkingAttendance extends AttendanceStates {}

class MarkedAttendance extends AttendanceStates {}

class AttendanceFetched extends AttendanceStates {
  final String? checkInTime;
  final String? checkOutTime;

  AttendanceFetched({this.checkInTime, this.checkOutTime});
}

class ErrorFetchingAttendance extends AttendanceStates{
  final String message;
  ErrorFetchingAttendance({required this.message});
}

class ErrorMarkingAttendance extends AttendanceStates {
  final String message;
  ErrorMarkingAttendance({required this.message});
}
