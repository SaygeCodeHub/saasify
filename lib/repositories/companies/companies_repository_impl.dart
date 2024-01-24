import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/companies/add_company_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/companies/companies_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<AddCompanyModel> addCompany(Map companyDetails) async {
    var userId = await cache.getUserId();
    try {
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$userId/${ApiConstants.createCompany}",
          companyDetails);
      return AddCompanyModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
