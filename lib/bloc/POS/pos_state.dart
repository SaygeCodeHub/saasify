import 'package:saasify/data/models/POS/product_with_categories_model.dart';

abstract class POSStates {}

class PosInitial extends POSStates {}

class ProductByCategoryLoading extends POSStates {}

class ProductByCategoryLoaded extends POSStates {
  final List<ProductsWithCategories> productsWithCategories;
  final int selectedCategory;

  ProductByCategoryLoaded(
      {required this.selectedCategory, required this.productsWithCategories});
}

class ProductByCategoryError extends POSStates {
  final String errorMessage;

  ProductByCategoryError({required this.errorMessage});
}
