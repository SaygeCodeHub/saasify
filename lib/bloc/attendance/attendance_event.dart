abstract class AttendanceEvents {}

class MarkAttendance extends AttendanceEvents {}

class CheckAttendance extends AttendanceEvents {
  final String? checkInTime;
  final String? checkOutTime;

  CheckAttendance({this.checkInTime, this.checkOutTime});
}

class FetchAttendance extends AttendanceEvents {}
