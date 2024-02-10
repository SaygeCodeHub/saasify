import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/attendance/attendance_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<AttendanceModel> markAttendance() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/markAttendance",
          {});
      return AttendanceModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<double>> getLatLong() async {
    final response = [21.1291499, 79.1153367];
    // final response = [21.1093896, 79.0802884];
    return response;
  }

  @override
  Future<AttendanceModel> getAttendance() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/todayAttendance");
      return AttendanceModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
