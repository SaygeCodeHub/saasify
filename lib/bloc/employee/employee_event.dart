abstract class EmployeeEvents {}

class InviteEmployee extends EmployeeEvents {}

class UpdateEmployee extends EmployeeEvents {
  final bool isSaveAndNext;

  UpdateEmployee({this.isSaveAndNext = false});
}

class GetAllEmployees extends EmployeeEvents {}

class GetEmployee extends EmployeeEvents {
  final int employeeId;

  GetEmployee({required this.employeeId});
}

class DeleteEmployee extends EmployeeEvents {}
