import 'package:saasify/data/models/salary_rollouts/fetch_salary_rollout_model.dart';

import '../../data/models/salary_rollouts/calculate_deduction_model.dart';

abstract class SalaryRolloutRepository {
  Future<FetchSalaryRolloutModel> fetchSalaryRollout();

  Future<CalculateDeductionModel> calculateDeduction(String employeeId);
}
