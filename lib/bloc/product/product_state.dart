import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/data/models/products/save_product_model.dart';

abstract class ProductStates {}

class ProductInitial extends ProductStates {}

class FetchingProduct extends ProductStates {}

class FetchedProduct extends ProductStates {
  List<ProductWithVariant> productList;

  FetchedProduct({required this.productList});
}

class ErrorFetchingProduct extends ProductStates {
  final String message;

  ErrorFetchingProduct({required this.message});
}

class SavingProduct extends ProductStates {}

class SavedProduct extends ProductStates {
  final String message;
  final ProductData data;

  SavedProduct({required this.data, required this.message});
}

class ErrorSavingProduct extends ProductStates {
  final String message;

  ErrorSavingProduct({required this.message});
}

class EditingProduct extends ProductStates {}

class EditedProduct extends ProductStates {
  final String message;

  EditedProduct({required this.message});
}

class ErrorEditingProduct extends ProductStates {
  final String message;

  ErrorEditingProduct({required this.message});
}

class DeletingProducts extends ProductStates {}

class DeletedProducts extends ProductStates {
  final String message;

  DeletedProducts({required this.message});
}

class ErrorDeletingProducts extends ProductStates {
  final String message;

  ErrorDeletingProducts({required this.message});
}

class FetchingCategories extends ProductStates {}

class FetchedCategories extends ProductStates {
  final List<ProductCategory> categoryList;

  FetchedCategories({required this.categoryList});
}

class ErrorFetchingCategories extends ProductStates {
  final String message;

  ErrorFetchingCategories({required this.message});
}

class CalculateGST extends ProductStates {}
