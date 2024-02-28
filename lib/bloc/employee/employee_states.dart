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

class UpdatingEmployee extends EmployeeStates {}

class EmployeeUpdated extends EmployeeStates {
  final String message;
  final bool isSaveAndNext;

  EmployeeUpdated({required this.message, this.isSaveAndNext = false});
}

class UpdatingEmployeeFailed extends EmployeeStates {
  final String errorMessage;

  UpdatingEmployeeFailed({required this.errorMessage});
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

class LoadingEmployee extends EmployeeStates {}

class EmployeeLoaded extends EmployeeStates {}

class LoadingEmployeeFailed extends EmployeeStates {
  final String errorMessage;

  LoadingEmployeeFailed({required this.errorMessage});
}

class DeletingEmployee extends EmployeeStates {}

class EmployeeDeleted extends EmployeeStates {}

class DeletingEmployeeFailed extends EmployeeStates {
  final String errorMessage;

  DeletingEmployeeFailed({required this.errorMessage});
}

class LoadingProfile extends EmployeeStates {}

class ProfileLoaded extends EmployeeStates {}

class LoadingProfileFailed extends EmployeeStates {
  final String errorMessage;

  LoadingProfileFailed({required this.errorMessage});
}
