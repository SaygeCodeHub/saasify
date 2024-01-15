abstract class BranchesEvents {}

class EditBranches extends BranchesEvents {
  final Map branchDetailsMap;

  EditBranches({required this.branchDetailsMap});
}

class DeleteBranches extends BranchesEvents {
  final int branchId;

  DeleteBranches({required this.branchId});
}

class FetchAllBranches extends BranchesEvents {}

class SaveBranch extends BranchesEvents {
  final Map branchDetailsMap;

  SaveBranch({required this.branchDetailsMap});
}
