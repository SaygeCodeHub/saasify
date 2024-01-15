import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/settle_order_model.dart';

abstract class BillingRepository {
  Future<FetchProductsByCategoryModel> fetchProductsByCategory(
      String userId, String companyId, int branchId);

  Future<SettleOrderModel> settleOrder(
      String userId, String companyId, int branchId, Map orderMap);
}
