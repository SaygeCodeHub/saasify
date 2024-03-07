import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/form/form_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class FormRepositoryImpl implements FormRepository {
  final Cache _cache = getIt<Cache>();

  @override
  Future<FormStructureModel> fetchFormStructure(String endpoint) async {
    try {
      final companyId = await _cache.getCompanyId();
      final branchId = await _cache.getBranchId();
      final userId = await _cache.getUserId();
      final formData = await ClientServices().get(
          "${ApiConstants.baseUrl3_0}$companyId/$branchId/$userId$endpoint");
      return FormStructureModel.fromJson(formData);
    } catch (e) {
      rethrow;
    }
  }
}
