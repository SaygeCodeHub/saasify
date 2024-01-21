import 'package:saasify/data/models/attendance/check_in_model.dart';
import 'package:saasify/data/models/attendance/check_out_model.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {

  @override
  Future<CheckInModel> checkIn(int employeeId, int branchId) async {
    final response = {
      "status": "success",
      "message": "Attendance marked successfully",
      "data": {
        "attendance": {
          "id": 1,
          "employee_id": 1,
          "branch_id": 1,
          "check_in": "2021-09-30T10:00:00.000000Z",
          "check_out": null,
          "created_at": "2021-09-30T10:00:00.000000Z",
          "updated_at": "2021-09-30T10:00:00.000000Z"
        }
      }
    };
    return CheckInModel.fromJson(response);
  }

  @override
  Future<CheckOutModel> checkOut(int employeeId, int branchId) async {
    final response = {
      "status": "success",
      "message": "Attendance marked successfully",
      "data": {
        "attendance": {
          "id": 1,
          "employee_id": 1,
          "branch_id": 1,
          "check_in": "2021-09-30T10:00:00.000000Z",
          "check_out": "2021-09-30T10:00:00.000000Z",
          "created_at": "2021-09-30T10:00:00.000000Z",
          "updated_at": "2021-09-30T10:00:00.000000Z"
        }
      }
    };
    return CheckOutModel.fromJson(response);
  }
}