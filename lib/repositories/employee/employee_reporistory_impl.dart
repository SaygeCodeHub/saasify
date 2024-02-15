import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/employee/add_employee_model.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/employee/get_employee_model.dart';
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
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/getEmployees");
      return GetAllEmployeesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<GetEmployeeModel> getEmployee(String employeeId) async {
    try {
      // var companyId = await cache.getCompanyId();
      // var branchId = await cache.getBranchId();
      // var userId = await cache.getUserId();
      final response = {
        "status": 200,
        "message": "User fetched!",
        "data": {
          "personal_info": {
            "first_name": "Ajayyyyy",
            "last_name": "Reddy",
            "middle_name": "",
            "user_id": 26,
            "user_contact": null,
            "alternate_contact": null,
            "user_image": "Image",
            "user_email": "areddy@gmail.com",
            "user_birthdate": null,
            "age": null,
            "gender": "",
            "nationality": "",
            "marital_status": "",
            "current_address": "",
            "permanent_address": "",
            "city": "",
            "state": "",
            "pincode": ""
          },
          "documents": {
            "aadhar": {
              "aadhar_number": null,
              "name_as_per_aadhar": "",
              "pan_number": ""
            },
            "passport": {
              "passport_num": "",
              "passport_fname": "",
              "passport_lname": "",
              "expiry_date": null,
              "issue_date": null,
              "mobile_number": null,
              "current_address": "",
              "permanent_address": ""
            }
          },
          "financial": {
            "finances": {
              "modified_on": "2024-02-13T14:50:40.27896+05:30",
              "modified_by": 1,
              "fin_id": 8,
              "user_id": 26,
              "basic_salary": 0.0,
              "BOA": 0.0,
              "bonus": 0.0,
              "PF": 0.0,
              "performance_bonus": 0.0,
              "gratuity": 0.0,
              "deduction": 0.0,
              "fixed_monthly_gross": 0.0,
              "total_annual_gross": 0.0,
              "can_edit": true
            },
            "bank_details": {
              "bank_detail_id": 5,
              "bank_name": "",
              "account_number": null,
              "ifsc_code": "",
              "branch": "",
              "account_type": "",
              "country": "",
              "modified_on": "2024-02-13T14:50:40.286867+05:30"
            }
          },
          "official": {
            "modified_on": "2024-02-13T15:49:40.227546+05:30",
            "modified_by": 1,
            "official_id": 3,
            "doj": null,
            "job_confirmation": null,
            "current_location": "",
            "department_head": 1,
            "reporting_manager": 1,
            "designations": [2],
            "approvers": [1],
            "accessible_modules": [
              {
                "module_key": "HR",
                "module_id": 0,
                "title": "HR",
                "icon": "",
                "accessible_features": [
                  {
                    "feature_key": "HR_MARK_ATTENDANCE",
                    "feature_id": 0.0,
                    "is_statistics": false,
                    "title": "Mark Attendance",
                    "icon": "",
                    "value": ""
                  },
                  {
                    "feature_key": "HR_PENDING_APPROVAL",
                    "feature_id": 0.1,
                    "is_statistics": true,
                    "title": "Pending Approval",
                    "icon": "",
                    "value": "0"
                  },
                  {
                    "feature_key": "HR_SALARY_ROLLOUT",
                    "feature_id": 0.2,
                    "is_statistics": true,
                    "title": "Salary Rollout",
                    "icon": "",
                    "value": "76170.15"
                  },
                  {
                    "feature_key": "HR_ADD_NEW_EMPLOYEE",
                    "feature_id": 0.3,
                    "is_statistics": false,
                    "title": "Add New Employee",
                    "icon": "",
                    "value": ""
                  },
                  {
                    "feature_key": "HR_VIEW_ALL_EMPLOYEES",
                    "feature_id": 0.4,
                    "is_statistics": true,
                    "title": "View All Employees",
                    "icon": "",
                    "value": "6"
                  },
                  {
                    "feature_key": "HR_APPLY_LEAVES",
                    "feature_id": 0.5,
                    "is_statistics": false,
                    "title": "Apply Leaves",
                    "icon": "",
                    "value": ""
                  },
                  {
                    "feature_key": "HR_MY_LEAVES",
                    "feature_id": 0.6,
                    "is_statistics": false,
                    "title": "My Leaves",
                    "icon": "",
                    "value": ""
                  },
                  {
                    "feature_key": "HR_TIMESHEET",
                    "feature_id": 0.7,
                    "is_statistics": false,
                    "title": "Timesheet",
                    "icon": "",
                    "value": ""
                  }
                ]
              }
            ],
            "can_edit": true
          }
        }
      };
      // final response = await ClientServices().get(
      //     "${ApiConstants.baseUrl}$companyId/$branchId/$userId/getUser?u_id=$employeeId");
      return GetEmployeeModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
