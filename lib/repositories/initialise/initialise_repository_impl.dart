import 'package:saasify/caches/cache.dart';
import 'package:saasify/caches/cache_keys.dart';
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
      //     {"device_token": 'xcv'});
      final response = {
        "status": 200,
        "message": "Data fetched!",
        "data": {
          "branches": [
            {
              "branch_name": "HQ",
              "branch_id": 25
            }
          ],
          "accessible_modules": [
            {
              "module_key": "ORDERS",
              "module_id": 0,
              "title": "HR",
              "icon": "",
              "accessible_features": [
                {
                  "feature_key": "HR_MARK_ATTENDANCE",
                  "feature_id": 0.0,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_PENDING_APPROVAL",
                  "feature_id": 0.1,
                  "is_statistics": true,
                  "title": "HR",
                  "icon": "",
                  "value": "0"
                },
                {
                  "feature_key": "HR_SALARY_ROLLOUT",
                  "feature_id": 0.2,
                  "is_statistics": true,
                  "title": "HR",
                  "icon": "",
                  "value": "0.0"
                },
                {
                  "feature_key": "HR_ADD_NEW_EMPLOYEE",
                  "feature_id": 0.3,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_VIEW_ALL_EMPLOYEES",
                  "feature_id": 0.4,
                  "is_statistics": true,
                  "title": "HR",
                  "icon": "",
                  "value": "1"
                },
                {
                  "feature_key": "HR_APPLY_LEAVES",
                  "feature_id": 0.5,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_MY_LEAVES",
                  "feature_id": 0.6,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_TIMESHEET",
                  "feature_id": 0.7,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                }
              ]
            }
          ],
          "available_modules": [
            {
              "module_key": "HR",
              "module_id": 0,
              "title": "HR",
              "icon": "",
              "available_features": [
                {
                  "feature_key": "HR_MARK_ATTENDANCE",
                  "feature_id": 0.0,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_PENDING_APPROVAL",
                  "feature_id": 0.1,
                  "is_statistics": true,
                  "title": "HR",
                  "icon": "",
                  "value": "0"
                },
                {
                  "feature_key": "HR_SALARY_ROLLOUT",
                  "feature_id": 0.2,
                  "is_statistics": true,
                  "title": "HR",
                  "icon": "",
                  "value": "0.0"
                },
                {
                  "feature_key": "HR_ADD_NEW_EMPLOYEE",
                  "feature_id": 0.3,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_VIEW_ALL_EMPLOYEES",
                  "feature_id": 0.4,
                  "is_statistics": true,
                  "title": "HR",
                  "icon": "",
                  "value": "1"
                },
                {
                  "feature_key": "HR_APPLY_LEAVES",
                  "feature_id": 0.5,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_MY_LEAVES",
                  "feature_id": 0.6,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                },
                {
                  "feature_key": "HR_TIMESHEET",
                  "feature_id": 0.7,
                  "is_statistics": false,
                  "title": "HR",
                  "icon": "",
                  "value": ""
                }
              ]
            }
          ],
          "geo_fencing": false
        }
      };
      return InitialiseAppModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
