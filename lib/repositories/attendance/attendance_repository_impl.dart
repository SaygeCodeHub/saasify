import 'package:saasify/data/models/attendance/attendance_model.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<AttendanceModel> markAttendance(
      int employeeId, int branchId, String time) async {
    final response = {
      "status": 200,
      "message": "Attendance marked successfully",
      "data": {
        "time": "2021-09-30T11:00:00.000000Z",
      }
    };
    return AttendanceModel.fromJson(response);
  }

  @override
  Future<List<double>> getLatLong() async {
    final response = [21.13126113476847, 79.15072233182553];
    // final response = [21.109362094865876, 79.08030722771204];
    return response;
  }
}
