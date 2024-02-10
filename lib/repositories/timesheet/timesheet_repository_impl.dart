import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/timesheet/timesheet_attendance_history_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/timesheet/timesheet_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class TimeSheetRepositoryImpl implements TimeSheetRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<TimesheetModel> timeSheetAttendanceHistory() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/attendanceHistory");
      return TimesheetModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
