import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/POS/checkout_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/POS/pos_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class POSRepositoryImpl implements POSRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<ProductsWithCategoriesModel> getAllProductsWithCategories() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();

      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/getCategoryWithProduct",
          {"are_products_required": 1});
      return ProductsWithCategoriesModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CheckOutModel> checkout(Map orderDetails) async {
    try {
      // var companyId = await cache.getCompanyId();
      // var branchId = await cache.getBranchId();
      // var userId = await cache.getUserId();

      Map<String, dynamic> response = {
        "status": 200,
        "message": "Order placed successfully",
        "data": {
          "order_id": 1,
          "order_date": "2021-09-01",
          "order_time": "10:00:00",
          "order_amount": 1000.00,
          "order_status": "Placed"
        }
      };

      // final response =  await ClientServices().post("${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.checkout}", orderDetails);
      return CheckOutModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
