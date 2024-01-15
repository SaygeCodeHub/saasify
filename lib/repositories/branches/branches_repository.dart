import '../../data/models/branches/delete_branches_model.dart';
import '../../data/models/branches/edit_branches_model.dart';
import '../../data/models/branches/fetch_all_branches_model.dart';
import '../../data/models/branches/save_branch_model.dart';

abstract class BranchesRepository {
  Future<FetchAllBranchesModel> fetchAllBranches(
      String userId, String companyId);

  Future<SaveBranchesModel> saveBranches(
      String userId, String companyId, int branchId, Map branchDetailsMap);

  Future<EditBranchesModel> editBranches(
      String userId, String companyId, int branchId, Map branchDetailsMap);

  Future<DeleteBranchesModel> deleteBranches(
      String userId, String companyId, int branchId, Map branchIdMap);
}
