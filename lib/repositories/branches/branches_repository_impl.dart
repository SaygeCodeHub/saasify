import '../../data/models/branches/delete_branches_model.dart';
import '../../data/models/branches/edit_branches_model.dart';
import '../../data/models/branches/fetch_all_branches_model.dart';
import '../../data/models/branches/save_branch_model.dart';
import '../../services/client_services.dart';
import '../../utils/constants/api_constants.dart';
import 'branches_repository.dart';

class BranchesRepositoryImpl implements BranchesRepository {
  @override
  Future<FetchAllBranchesModel> fetchAllBranches(
      String userId, String companyId) async {
    final response = await ClientServices()
        .get('${ApiConstants.baseUrl}$userId/$companyId/getAllBranches');
    return FetchAllBranchesModel.fromJson(response);
  }

  @override
  Future<SaveBranchesModel> saveBranches(String userId, String companyId,
      int branchId, Map productDetailsMap) async {
    final response = await ClientServices().post(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/addProduct',
        productDetailsMap);
    return SaveBranchesModel.fromJson(response);
  }

  @override
  Future<EditBranchesModel> editBranches(String userId, String companyId,
      int branchId, Map productDetailsMap) async {
    final response = await ClientServices().put(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/editProduct',
        productDetailsMap);
    return EditBranchesModel.fromJson(response);
  }

  @override
  Future<DeleteBranchesModel> deleteBranches(
      String userId, String companyId, int branchId, Map variantIdMap) async {
    final response = await ClientServices().delete(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/deleteVariant',
        variantIdMap);
    return DeleteBranchesModel.fromJson(response);
  }
}
