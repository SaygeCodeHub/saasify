import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/details/fetch_details_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/details/details_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  final Cache _cache = getIt<Cache>();

  @override
  Future<FetchDetailsModel> fetchDetails(String endpoint) async {
    try {
      final companyId = await _cache.getCompanyId();
      final branchId = await _cache.getBranchId();
      final userId = await _cache.getUserId();

      final response = await ClientServices().get(
          "${ApiConstants.baseUrl3_0}$companyId/$branchId/$userId$endpoint");

      return FetchDetailsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
