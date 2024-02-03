import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/leaves/apply_leave_model.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/leaves/leaves_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class LeavesRepositoryImpl implements LeavesRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<LoadApplyLeaveScreenModel> loadApplyLeaveScreen() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.loadApplyLeaveScreen}");
      return LoadApplyLeaveScreenModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ApplyLeaveModel> applyLeave(Map leaveDetailsMap) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.applyLeave}",
          leaveDetailsMap);
      return ApplyLeaveModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<GetAllLeavesModel> getAllLeaves() async {
    try {
      // var companyId = await cache.getCompanyId();
      // var branchId = await cache.getBranchId();
      // var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}14/15/30/getAllLeaves");
      return GetAllLeavesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
