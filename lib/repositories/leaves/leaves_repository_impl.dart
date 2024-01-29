import 'package:saasify/data/models/leaves/load_apply_leave_model.dart';
import '../../caches/cache.dart';
import '../../di/app_module.dart';
import '../../services/client_services.dart';
import '../../utils/constants/api_constants.dart';
import 'leaves_repository.dart';

class LeavesRepositoryImpl implements LeavesRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<LoadApplyLeaveModel> loadApplyLeave() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.loadApplyLeaveScreen}");
      return LoadApplyLeaveModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}