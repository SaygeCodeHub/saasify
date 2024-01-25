abstract class AttendanceStates {}

class AttendanceInitial extends AttendanceStates {}

class MarkingAttendance extends AttendanceStates {}

class MarkedAttendance extends AttendanceStates {}

class ErrorMarkingAttendance extends AttendanceStates {
  final String message;
  ErrorMarkingAttendance({required this.message});
}
