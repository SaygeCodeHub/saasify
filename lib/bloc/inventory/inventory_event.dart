import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';

abstract class InventoryEvents {}

class FetchInventoryList extends InventoryEvents {}

class SelectInventoryItem extends InventoryEvents {
  List<InventoryProduct> productList;

  SelectInventoryItem({required this.productList});
}

class UpdateStock extends InventoryEvents {
  final Map updateStockMap;

  UpdateStock({required this.updateStockMap});
}
