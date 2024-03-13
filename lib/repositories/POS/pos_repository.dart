import 'package:saasify/data/models/POS/checkout_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';

abstract class POSRepository {
  Future<ProductsWithCategoriesModel> getAllProductsWithCategories();
  Future<CheckOutModel> checkout(Map orderDetails);
}
