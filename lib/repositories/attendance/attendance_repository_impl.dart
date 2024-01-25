import 'package:saasify/data/models/attendance/attendance_model.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<AttendanceModel> markAttendance(
      String companyId, String branchId, String userId) async {
    final response = {
      "status": 200,
      "message": "Attendance fetched successfully",
      "data": {
        "check_in":
            // null
        "2024-01-25T22:40:49.888987+05:30"
        ,
        "check_out":
            // null
        "2024-01-25T22:41:05.263917+05:30"
      }
    };
    // await ClientServices().post(
    //     "${ApiConstants.baseUrl}$companyId/$branchId/$userId/markAttendance",
    //     {});
    return AttendanceModel.fromJson(response);
  }

  @override
  Future<List<double>> getLatLong() async {
    final response = [21.1458004,79.0881546];
    // final response = [21.1093896, 79.0802884];
    return response;
  }

  @override
  Future<AttendanceModel> getAttendance(String companyId, String branchId, String userId) async {
    final response = {
      "status": 200,
      "message": "Attendance fetched successfully",
      "data": {
        "check_in": null,
        "check_out": null
      }
    };
    // await ClientServices().post(
    //     "${ApiConstants.baseUrl}$companyId/$branchId/$userId/todayAttendance",
    //     {});
    return AttendanceModel.fromJson(response);
  }
}
