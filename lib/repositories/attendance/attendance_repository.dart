import 'package:saasify/data/models/attendance/attendance_model.dart';

abstract class AttendanceRepository {
  Future<AttendanceModel> markAttendance(
      String companyId, String branchId, String userId);
  Future<List<double>> getLatLong();
}
