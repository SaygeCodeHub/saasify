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

class UpdatingEmployee extends EmployeeStates {}

class EmployeeUpdated extends EmployeeStates {
  final String message;

  EmployeeUpdated({required this.message});
}

class UpdatingEmployeeFailed extends EmployeeStates {
  final String errorMessage;

  UpdatingEmployeeFailed({required this.errorMessage});
}

class GettingEmployee extends EmployeeStates {}

class GotEmployee extends EmployeeStates {}

class GettingEmployeeFailed extends EmployeeStates {
  final String errorMessage;

  GettingEmployeeFailed({required this.errorMessage});
}
