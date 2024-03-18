import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/viewData/view_data_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class ViewDataRepositoryImpl implements ViewDataRepository {
  final Cache _cache = getIt<Cache>();

  @override
  Future<ViewDataModel> fetchData(String endpoint, Map data) async {
    try {
      final companyId = await _cache.getCompanyId();
      final branchId = await _cache.getBranchId();
      final userId = await _cache.getUserId();

      final response = await ClientServices().post(
          "${ApiConstants.baseUrl3_0}$companyId/$branchId/$userId$endpoint",
          data);
      return ViewDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
