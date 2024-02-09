import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/initialise/initialise_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class InitialiseRepositoryImpl implements InitialiseRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<InitialiseAppModel> initialiseApp() async {
    var companyId = await cache.getCompanyId();
    var branchId = await cache.getBranchId();
    var userId = await cache.getUserId();
    try {
      // final response = await ClientServices().post(
      //     "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.initializeApi}",
      //     {"device_token": "yxz"});
      final response = {
        "status": 200,
        "message": "Data fetched!",
        "data": {
          "geo_fencing": true,
          "branches": [
            {"branch_name": "Pune", "branch_id": 10},
            {"branch_name": "Nagpur", "branch_id": 12}
          ],
          "accessible_modules": [
            {"module_key": "", "module_id": 0, "title": "HRMS", "icon": ""}
          ],
          "accessible_features": [
            {
              "feature_key": "HR_MARK_ATTENDANCE",
              "feature_id": 0.0,
              "is_statistics": true,
              "title": "Mark Attendance",
              "icon": "",
              "value": '200'
            },
            {
              "feature_key": "HR_PENDING_APPROVAL",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "Pending approval",
              "icon": "",
              "value": '10'
            },
            {
              "feature_key": "HR_TOTAL_EMPLOYEES",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "Total Employees",
              "icon": "",
              "value": '21'
            },
            {
              "feature_key": "HR_SALARY_ROLLOUT",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "Salary Rollout",
              "icon": "",
              "value": 'Rs. 21,190'
            },
            {
              "feature_key": "HR_ADD_NEW_EMPLOYEE",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "Add New Employee",
              "icon": "",
              "value": ''
            },
            {
              "feature_key": "HR_APPLY_LEAVES",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "Apply Leave",
              "icon": "",
              "value": ''
            },
            {
              "feature_key": "HR_MY_LEAVES",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "My Leaves",
              "icon": "",
              "value": ''
            },
            {
              "feature_key": "HR_TIMESHEET",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "Timesheet",
              "icon": "",
              "value": ''
            },
          ]
        }
      };
      return InitialiseAppModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
