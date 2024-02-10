import 'package:saasify/data/models/attendance/attendance_model.dart';

abstract class AttendanceRepository {
  Future<AttendanceModel> markAttendance();

  Future<AttendanceModel> getAttendance();

  Future<List<double>> getLatLong();
}
