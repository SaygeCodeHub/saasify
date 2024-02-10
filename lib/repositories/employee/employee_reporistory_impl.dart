import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/employee/add_employee_model.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/employee/invite_employee_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/employee/employee_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<InviteEmployeeModel> inviteEmployee(Map inviteDetails) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/sendInvite",
          inviteDetails);
      return InviteEmployeeModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<UpdateEmployeeModel> updateEmployee(
      Map employeeDetails, String employeeId) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/updateUser?u_id=$employeeId",
          employeeDetails);
      return UpdateEmployeeModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<GetAllEmployeesModel> getAllEmployees() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/getAllUsers");
      return GetAllEmployeesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<GetAllEmployeesModel> getAllEmployees() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/getEmployees");
      return GetAllEmployeesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
