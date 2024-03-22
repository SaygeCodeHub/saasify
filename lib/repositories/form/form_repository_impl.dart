import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/posOffline/pos_offline_data.dart';
import 'package:saasify/posOffline/screenMock/add_category_mock.dart';
import 'package:saasify/posOffline/screenMock/add_product.dart';
import 'package:saasify/posOffline/screenMock/add_variant.dart';
import 'package:saasify/repositories/form/form_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'package:saasify/utils/globals.dart';

class FormRepositoryImpl implements FormRepository {
  final Cache _cache = getIt<Cache>();
  final PosOfflineModel posOfflineModel = getIt<PosOfflineModel>();

  @override
  Future<FormStructureModel> fetchFormStructure(String endpoint) async {
    try {
      if (isOnline == true) {
        final companyId = await _cache.getCompanyId();
        final branchId = await _cache.getBranchId();
        final userId = await _cache.getUserId();
        final formData = await ClientServices().get(
            "${ApiConstants.baseUrl3_0}$companyId/$branchId/$userId$endpoint");
        return FormStructureModel.fromJson(formData);
      } else {
        switch (endpoint) {
          case '/buildProductForm':
            return FormStructureModel.fromJson(addProduct);
          case '/buildVariantForm':
            return FormStructureModel.fromJson(addVariant);
          case '/buildCategoryForm':
            return FormStructureModel.fromJson(addCategory);
          default:
            return FormStructureModel.fromJson({});
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
