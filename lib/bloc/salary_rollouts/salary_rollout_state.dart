import 'package:saasify/data/models/salary_rollouts/calculate_deduction_model.dart';

import '../../data/models/salary_rollouts/fetch_salary_rollout_model.dart';

abstract class SalaryRolloutStates {}

class SalaryRolloutInitial extends SalaryRolloutStates {}

class FetchingSalaryRollouts extends SalaryRolloutStates {}

class SalaryRolloutsFetched extends SalaryRolloutStates {
  final FetchSalaryRolloutModel fetchSalaryRolloutModel;

  SalaryRolloutsFetched({required this.fetchSalaryRolloutModel});
}

class ErrorFetchingSalaryRollouts extends SalaryRolloutStates {
  final String errorMessage;

  ErrorFetchingSalaryRollouts({required this.errorMessage});
}

class FetchingSalaryCalculation extends SalaryRolloutStates {}

class SalaryCalculationFetched extends SalaryRolloutStates {
  final CalculateDeductionModel calculateDeductionModel;

  SalaryCalculationFetched({required this.calculateDeductionModel});
}

class ErrorFetchingSalaryCalculation extends SalaryRolloutStates {
  final String errorMessage;

  ErrorFetchingSalaryCalculation({required this.errorMessage});
}

class RollingOutIndividualSalary extends SalaryRolloutStates {}

class IndividualSalaryRolledOut extends SalaryRolloutStates {
  final String message;

  IndividualSalaryRolledOut({required this.message});
}

class ErrorRollingOutIndividualSalary extends SalaryRolloutStates {
  final String errorMessage;

  ErrorRollingOutIndividualSalary({required this.errorMessage});
}

class RollingOutAllSalaries extends SalaryRolloutStates {}

class AllSalariesRolledOut extends SalaryRolloutStates {
  final String message;

  AllSalariesRolledOut({required this.message});
}

class ErrorRollingOutAllSalaries extends SalaryRolloutStates {
  final String errorMessage;

  ErrorRollingOutAllSalaries({required this.errorMessage});
}
