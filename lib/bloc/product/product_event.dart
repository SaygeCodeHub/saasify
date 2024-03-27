import 'package:saasify/models/category/product_categories.dart';
import 'package:saasify/models/product/products.dart';

abstract class ProductEvent {}

class AddProduct extends ProductEvent {
  final List<ProductCategories> categories;
  final Products product;

  AddProduct({required this.product, required this.categories});
}
