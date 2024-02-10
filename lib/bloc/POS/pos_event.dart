import 'package:saasify/data/models/POS/product_with_categories_model.dart';

abstract class POSEvents {}

class FetchProductsWithCategories extends POSEvents {}

class ReloadPOS extends POSEvents {
  final List<ProductsWithCategories> productsWithCategories;

  ReloadPOS({required this.productsWithCategories});
}

class AddCartItem extends POSEvents {
  final String productName;
  final Variant variant;

  AddCartItem({required this.productName, required this.variant});
}

class RemoveCartItem extends POSEvents {
  final int variantId;

  RemoveCartItem({required this.variantId});
}
