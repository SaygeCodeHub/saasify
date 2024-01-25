import 'dart:developer';

import 'package:saasify/data/models/attendance/attendance_model.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<AttendanceModel> markAttendance(
      int employeeId, int branchId, String time) async {
    log(time);
    final response = {
      "status": 200,
      "message": "Attendance marked successfully",
      "data": {}
    };
    return AttendanceModel.fromJson(response);
  }

  @override
  Future<List<double>> getLatLong() async {
    // final response = [21.13126113476847,79.15072233182553];
    final response = [21.1093957, 79.0802707];
    return response;
  }
}
