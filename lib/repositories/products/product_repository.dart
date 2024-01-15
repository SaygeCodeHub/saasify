import 'package:saasify/data/models/products/delete_product_model.dart';
import 'package:saasify/data/models/products/edit_product_model.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/data/models/products/save_product_model.dart';

abstract class ProductRepository {
  Future<FetchProductListModel> fetchProductList(
      String userId, String companyId, int branchId);

  Future<FetchAllCategoriesModel> fetchAllCategories(
      String userId, String companyId, int branchId);

  Future<SaveProductModel> saveProduct(
      String userId, String companyId, int branchId, Map productDetailsMap);

  Future<EditProductModel> editProduct(
      String userId, String companyId, int branchId, Map productDetailsMap);

  Future<DeleteProductsModel> deleteProduct(
      String userId, String companyId, int branchId, Map variantIdMap);
}
