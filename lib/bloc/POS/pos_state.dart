import 'package:saasify/data/models/POS/product_with_categories_model.dart';

abstract class POSStates {}

class PosInitial extends POSStates {}

class ProductByCategoryLoading extends POSStates {}

class ProductByCategoryLoaded extends POSStates {
  final List<ProductsWithCategoriesModel> productWithCategories;

  ProductByCategoryLoaded({required this.productWithCategories});
}

class ProductByCategoryError extends POSStates {
  final String errorMessage;

  ProductByCategoryError({required this.errorMessage});
}