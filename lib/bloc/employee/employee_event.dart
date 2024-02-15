abstract class EmployeeEvents {}

class InviteEmployee extends EmployeeEvents {}

class UpdateEmployee extends EmployeeEvents {
  final int? employeeId;

  UpdateEmployee({this.employeeId});
}

class GetAllEmployees extends EmployeeEvents {}

class GetEmployee extends EmployeeEvents {
  final int employeeId;

  GetEmployee({required this.employeeId});
}
