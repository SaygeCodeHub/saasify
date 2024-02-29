import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/salary_rollouts/calculate_deduction_model.dart';
import 'package:saasify/data/models/salary_rollouts/fetch_salary_rollout_model.dart';
import 'package:saasify/data/models/salary_rollouts/roll_out_salaries.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/salary_rollouts/salary_rollout_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class SalaryRolloutRepositoryImpl implements SalaryRolloutRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<FetchSalaryRolloutModel> fetchSalaryRollout() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.getSalaries}");
      return FetchSalaryRolloutModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CalculateDeductionModel> calculateDeduction(String employeeId) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.calculateDeductions}?u_id=$employeeId");
      return CalculateDeductionModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<RolloutSalariesModel> allRollouts() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.rolloutAllSalaries}",
          {});
      return RolloutSalariesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<RolloutSalariesModel> individualRollouts(String employeeId) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.rolloutIndividualSalaries}?u_id=$employeeId",
          {});
      return RolloutSalariesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
