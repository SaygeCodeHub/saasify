import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/settle_order_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'billing_repository.dart';

class BillingRepositoryImpl implements BillingRepository {
  @override
  Future<FetchProductsByCategoryModel> fetchProductsByCategory(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getProductsByCategory');
    return FetchProductsByCategoryModel.fromJson(response);
  }

  @override
  Future<SettleOrderModel> settleOrder(
      String userId, String companyId, int branchId, Map orderMap) async {
    final response = await ClientServices().post(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/bookOrder',
        orderMap);
    return SettleOrderModel.fromJson(response);
  }
}
