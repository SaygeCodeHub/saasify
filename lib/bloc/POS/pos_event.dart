import 'package:saasify/data/models/POS/product_with_categories_model.dart';

abstract class POSEvents {}

class FetchProductsWithCategories extends POSEvents {}

class ReloadPOS extends POSEvents {
  final List<ProductsWithCategories> productsWithCategories;

  ReloadPOS({required this.productsWithCategories});
}

class AddCartItem extends POSEvents {
  final List<ProductsWithCategories> productsWithCategories;
  final String productName;
  final int id;
  final Variant? variant;

  AddCartItem(
      {required this.id,
      required this.productsWithCategories,
      required this.productName,
      this.variant});
}

class RemoveCartItem extends POSEvents {
  final List<ProductsWithCategories> productsWithCategories;
  final int variantId;

  RemoveCartItem(
      {required this.productsWithCategories, required this.variantId});
}

class CalculateBill extends POSEvents {
  final List<ProductsWithCategories> productsWithCategories;

  CalculateBill({required this.productsWithCategories});
}

class ClearCart extends POSEvents {
  final List<ProductsWithCategories> productsWithCategories;

  ClearCart({required this.productsWithCategories});
}

class Checkout extends POSEvents {
  final String paymentMethod;

  Checkout({required this.paymentMethod});
}
