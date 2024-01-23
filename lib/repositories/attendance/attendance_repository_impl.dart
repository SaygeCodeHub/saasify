import 'package:saasify/data/models/attendance/check_in_model.dart';
import 'package:saasify/data/models/attendance/check_out_model.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<CheckInModel> checkIn(
      int employeeId, int branchId, String time) async {
    final response = {
      "status": 200,
      "message": "Attendance marked successfully",
      "data": {}
    };
    return CheckInModel.fromJson(response);
  }

  @override
  Future<CheckOutModel> checkOut(
      int employeeId, int branchId, String time) async {
    final response = {
      "status": 200,
      "message": "Attendance marked successfully",
      "data": {}
    };
    return CheckOutModel.fromJson(response);
  }

  @override
  Future<List<double>> getLatLong() async {
    final response = [21.13126113476847, 79.15072233182553];
    // final response = [21.109362094865876, 79.08030722771204];
    return response;
  }
}
