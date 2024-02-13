abstract class EmployeeEvents {}

class InviteEmployee extends EmployeeEvents {}

class UpdateEmployee extends EmployeeEvents {
  final String? employeeId;

  UpdateEmployee({this.employeeId});
}

class GetAllEmployees extends EmployeeEvents {}
