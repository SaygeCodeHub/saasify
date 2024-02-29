import 'package:saasify/data/models/salary_rollouts/fetch_salary_rollout_model.dart';

import '../../data/models/salary_rollouts/calculate_deduction_model.dart';
import '../../data/models/salary_rollouts/roll_out_salaries.dart';

abstract class SalaryRolloutRepository {
  Future<FetchSalaryRolloutModel> fetchSalaryRollout();

  Future<CalculateDeductionModel> calculateDeduction(String employeeId);

  Future<RolloutSalariesModel> individualRollouts(String employeeId);

  Future<RolloutSalariesModel> allRollouts();
}
