import 'package:saasify/data/models/POS/product_with_categories_model.dart';

abstract class POSEvents {}

class FetchProductsWithCategories extends POSEvents {}

class CategorySelected extends POSEvents {
  final List<ProductsWithCategories> productsWithCategories;
  final int selectedCategory;

  CategorySelected(
      {required this.productsWithCategories, required this.selectedCategory});
}
