import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/employee/invite_employee_model.dart';

abstract class EmployeeRepository {
  Future<InviteEmployeeModel> inviteEmployee(Map inviteDetails);
  Future<GetAllEmployeesModel> getAllEmployees();
}
