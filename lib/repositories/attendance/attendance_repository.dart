import 'package:saasify/data/models/attendance/attendance_model.dart';

abstract class AttendanceRepository {
  Future<AttendanceModel> markAttendance(
      int employeeId, int branchId, String time);
  Future<List<double>> getLatLong();
}
