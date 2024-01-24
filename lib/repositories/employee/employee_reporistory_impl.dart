import 'package:saasify/data/models/employee/invite_employee_model.dart';
import 'package:saasify/repositories/employee/employee_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  @override
  Future<InviteEmployeeModel> inviteEmployee(Map inviteDetails) async {
    try {
      final response = await ClientServices()
          .post("${ApiConstants.baseUrl}1/1/8/sendInvite}", inviteDetails);
      return InviteEmployeeModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
