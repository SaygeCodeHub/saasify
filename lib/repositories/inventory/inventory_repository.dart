import 'dart:async';
import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';
import 'package:saasify/data/models/inventory/update_stock_model.dart';

abstract class InventoryRepository {
  Future<FetchInventoryProductsModel> fetchInventoryProductList(
      String userId, String companyId, int branchId);

  Future<UpdateStockModel> updateStock(
      String userId, String companyId, int branchId, Map updateStockMap);
}
