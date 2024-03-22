import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/posOffline/screenMock/view_category_mock.dart';
import 'package:saasify/posOffline/screenMock/view_products_mock.dart';
import 'package:saasify/repositories/viewData/view_data_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'package:saasify/utils/globals.dart';

class ViewDataRepositoryImpl implements ViewDataRepository {
  final Cache _cache = getIt<Cache>();

  @override
  Future<ViewDataModel> fetchData(String endpoint, Map data) async {
    try {
      final companyId = await _cache.getCompanyId();
      final branchId = await _cache.getBranchId();
      final userId = await _cache.getUserId();
      if (isOnline == true) {
        final response = await ClientServices().post(
            "${ApiConstants.baseUrl3_0}$companyId/$branchId/$userId$endpoint",
            data);
        return ViewDataModel.fromJson(response);
      } else {
        switch (endpoint) {
          case '/buildCategories':
            return ViewDataModel.fromJson(viewCategory);
          case '/buildProducts':
            return ViewDataModel.fromJson(viewProducts);
          default:
            return ViewDataModel.fromJson({});
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
