import '../../data/models/branches/fetch_all_branches_model.dart';

abstract class BranchesStates {}

class BranchesInitial extends BranchesStates {}

class EditingBranches extends BranchesStates {}

class EditedBranches extends BranchesStates {
  final String message;

  EditedBranches({required this.message});
}

class ErrorEditingBranches extends BranchesStates {
  final String message;

  ErrorEditingBranches({required this.message});
}

class DeletingBranches extends BranchesStates {}

class DeletedBranches extends BranchesStates {
  final String message;

  DeletedBranches({required this.message});
}

class ErrorDeletingBranches extends BranchesStates {
  final String message;

  ErrorDeletingBranches({required this.message});
}

class FetchingBranches extends BranchesStates {}

class FetchedBranches extends BranchesStates {
  final List<BranchesData> branchList;

  FetchedBranches({required this.branchList});
}

class ErrorFetchingBranches extends BranchesStates {
  final String message;

  ErrorFetchingBranches({required this.message});
}

class SavingBranch extends BranchesStates {}

class SavedBranch extends BranchesStates {
  final String message;

  // final ProductData data;

  SavedBranch({required this.message});
}

class ErrorSavingBranch extends BranchesStates {
  final String message;

  ErrorSavingBranch({required this.message});
}
