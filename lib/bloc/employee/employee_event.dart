abstract class EmployeeEvents {}

class InviteEmployee extends EmployeeEvents {
  final Map inviteDetails;

  InviteEmployee({required this.inviteDetails});
}

class UpdateEmployee extends EmployeeEvents {
  final String? employeeId;

  UpdateEmployee({this.employeeId});
}

class GetAllEmployees extends EmployeeEvents {}

class GetEmployee extends EmployeeEvents {
  final String employeeId;

  GetEmployee({required this.employeeId});
}
