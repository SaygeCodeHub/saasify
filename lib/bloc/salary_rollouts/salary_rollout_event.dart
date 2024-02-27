abstract class SalaryRolloutEvents {}

class FetchSalaryRollout extends SalaryRolloutEvents {}

class FetchRolloutCalculation extends SalaryRolloutEvents {
  final String employeeId;

  FetchRolloutCalculation({required this.employeeId});
}

class RollOutIndividualSalary extends SalaryRolloutEvents {
  final String employeeId;

  RollOutIndividualSalary({required this.employeeId});
}

class RollOutAllSalary extends SalaryRolloutEvents {}
