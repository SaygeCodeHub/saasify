import 'package:saasify/data/models/attendance/attendance_model.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<AttendanceModel> markAttendance(
      String companyId, String branchId, String userId) async {
    // Dummy response
    final response = {
      "status": 200,
      "message": "Attendance fetched successfully",
      "data": {
        "check_in":
            // null
            DateTime.now().toIso8601String(),
        "check_out":
            // null
            DateTime.now().toIso8601String()
      }
    };

    // Actual API call
    // await ClientServices().post(
    //     "${ApiConstants.baseUrl}$companyId/$branchId/$userId/markAttendance",
    //     {});
    return AttendanceModel.fromJson(response);
  }

  @override
  Future<List<double>> getLatLong() async {
    final response = [21.1291499, 79.1153367];
    // final response = [21.1093896, 79.0802884];
    return response;
  }

  @override
  Future<AttendanceModel> getAttendance(
      String companyId, String branchId, String userId) async {
    // Dummy response
    final response = {
      "status": 200,
      "message": "Attendance fetched successfully",
      "data": {"check_in": DateTime.now().toIso8601String(), "check_out": null}
    };

    // Actual API call
    // await ClientServices().post(
    //     "${ApiConstants.baseUrl}$companyId/$branchId/$userId/todayAttendance",
    //     {});
    return AttendanceModel.fromJson(response);
  }
}
