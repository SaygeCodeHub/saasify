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
              "feature_key": "",
              "feature_id": 0.1,
              "is_statistics": true,
              "title": "Pending approval",
              "icon": "",
              "value": 200.00
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
