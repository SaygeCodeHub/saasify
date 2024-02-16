abstract class EmployeeEvents {}

class InviteEmployee extends EmployeeEvents {}

class UpdateEmployee extends EmployeeEvents {}

class GetAllEmployees extends EmployeeEvents {}

class GetEmployee extends EmployeeEvents {
  final int employeeId;

  GetEmployee({required this.employeeId});
}
