import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/settle_order_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../di/app_module.dart';
import 'billing_repository.dart';

class BillingRepositoryImpl implements BillingRepository {
  final db = FirebaseFirestore.instance;
  final CustomerCache _customerCache = getIt<CustomerCache>();

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

  @override
  Future<List<QueryDocumentSnapshot>> getAllTabs() async {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    final response = await db
        .collection("$userId-$companyId-$branchId-unsettled_tabs")
        .get();

    return response.docs;
  }

  @override
  Future<void> saveTab(Map<String, dynamic> customer, String id) async {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    db
        .collection("$userId-$companyId-$branchId-unsettled_tabs")
        .doc(id)
        .set(customer)
        .whenComplete(() => () {
              return "success";
            })
        .catchError((error, stacktrace) {
      throw Exception(error);
    });
  }

  @override
  Future<void> removeTab(String id) async {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    db
        .collection("$userId-$companyId-$branchId-unsettled_tabs")
        .doc(id)
        .delete()
        .whenComplete(() => () {
              return "success";
            })
        .catchError((error, stacktrace) {
      throw Exception(error);
    });
  }
}
