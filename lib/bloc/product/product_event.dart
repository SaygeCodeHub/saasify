import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/products/product_list_model.dart';

abstract class ProductEvents {}

class FetchProductList extends ProductEvents {}

class SaveProduct extends ProductEvents {
  final Map productDetailsMap;

  SaveProduct({required this.productDetailsMap});
}

class EditProduct extends ProductEvents {
  final Map productDetailsMap;

  EditProduct({required this.productDetailsMap});
}

class DeleteProducts extends ProductEvents {
  final List<int> variantIds;

  DeleteProducts({required this.variantIds});
}

class ProductSelected extends ProductEvents {
  List<ProductWithVariant> productList;

  ProductSelected({required this.productList});
}

class FetchAllCategories extends ProductEvents {}

class LoadForm extends ProductEvents {
  final List<ProductCategory> categoryList;

  LoadForm({required this.categoryList});
}
