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
