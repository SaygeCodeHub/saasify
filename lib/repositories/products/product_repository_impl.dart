import 'package:saasify/data/models/products/delete_product_model.dart';
import 'package:saasify/data/models/products/edit_product_model.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/data/models/products/save_product_model.dart';
import 'package:saasify/repositories/products/product_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<FetchProductListModel> fetchProductList(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllProducts');
    return FetchProductListModel.fromJson(response);
  }

  @override
  Future<FetchAllCategoriesModel> fetchAllCategories(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllCategories');
    return FetchAllCategoriesModel.fromJson(response);
  }

  @override
  Future<SaveProductModel> saveProduct(String userId, String companyId,
      int branchId, Map productDetailsMap) async {
    final response = await ClientServices().post(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/addProduct',
        productDetailsMap);
    return SaveProductModel.fromJson(response);
  }

  @override
  Future<EditProductModel> editProduct(String userId, String companyId,
      int branchId, Map productDetailsMap) async {
    final response = await ClientServices().put(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/editProduct',
        productDetailsMap);
    return EditProductModel.fromJson(response);
  }

  @override
  Future<DeleteProductsModel> deleteProduct(
      String userId, String companyId, int branchId, Map variantIdMap) async {
    final response = await ClientServices().delete(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/deleteVariant',
        variantIdMap);
    return DeleteProductsModel.fromJson(response);
  }
}
