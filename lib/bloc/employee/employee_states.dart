import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/employee/invite_employee_model.dart';

abstract class EmployeeStates {}

class InitialisingEmployeeStates extends EmployeeStates {}

class InvitingEmployee extends EmployeeStates {}

class InvitationSent extends EmployeeStates {
  InviteEmployeeModel inviteEmployeeModel;
  InvitationSent({required this.inviteEmployeeModel});
}

class InvitingFailed extends EmployeeStates {
  final String errorMessage;

  InvitingFailed({required this.errorMessage});
}

class LoadingEmployees extends EmployeeStates {}

class EmployeesLoaded extends EmployeeStates {
  final List<EmployeeListData> employees;

  EmployeesLoaded({required this.employees});
}

class LoadingEmployeesFailed extends EmployeeStates {
  final String errorMessage;

  LoadingEmployeesFailed({required this.errorMessage});
}
