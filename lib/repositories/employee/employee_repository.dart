import 'package:saasify/data/models/employee/invite_employee_model.dart';

abstract class EmployeeRepository {
  Future<InviteEmployeeModel> inviteEmployee(Map inviteDetails);
}
