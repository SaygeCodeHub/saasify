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
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.initializeApi}",
          {"device_token": 'xcv'});
      return InitialiseAppModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
