import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';
import 'package:saasify/data/models/inventory/update_stock_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

import 'inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  @override
  Future<FetchInventoryProductsModel> fetchInventoryProductList(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getInventoryProducts');

    return FetchInventoryProductsModel.fromJson(response);
  }

  @override
  Future<UpdateStockModel> updateStock(
      String userId, String companyId, int branchId, Map updateStockMap) async {
    final response = await ClientServices().post(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/updateStock',
        updateStockMap);

    return UpdateStockModel.fromJson(response);
  }
}
