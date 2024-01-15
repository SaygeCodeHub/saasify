import '../../data/models/categories/delete_categories_model.dart';
import '../../data/models/categories/edit_categories_model.dart';
import '../../data/models/categories/fetch_all_categories_model.dart';
import '../../services/client_services.dart';
import '../../utils/constants/api_constants.dart';
import 'categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  @override
  Future<FetchAllCategoriesModel> fetchAllCategories(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllCategories');
    return FetchAllCategoriesModel.fromJson(response);
  }

  @override
  Future<EditCategoriesModel> editCategories(String userId, String companyId,
      int branchId, Map categoriesDetailsMap) async {
    final response = await ClientServices().put(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/editCategory',
        categoriesDetailsMap);
    return EditCategoriesModel.fromJson(response);
  }

  @override
  Future<DeleteCategoriesModel> deleteCategories(
      String userId, String companyId, int branchId, Map categoryIdMap) async {
    final response = await ClientServices().delete(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/deleteCategory',
        categoryIdMap);
    return DeleteCategoriesModel.fromJson(response);
  }
}
