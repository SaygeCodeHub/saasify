import 'package:saasify/data/models/attendance/attendance_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  @override
  Future<AttendanceModel> markAttendance(
      String companyId, String branchId, String userId) async {
    final response = await ClientServices().post(
        "${ApiConstants.baseUrl}$companyId/$branchId/$userId/markAttendance",
        {});
    return AttendanceModel.fromJson(response);
  }

  @override
  Future<List<double>> getLatLong() async {
    // final response = [21.13126113476847,79.15072233182553];
    final response = [21.1093896, 79.0802884];
    return response;
  }
}
