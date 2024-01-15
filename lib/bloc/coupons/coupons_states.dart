abstract class CouponsStates {}

class CouponsInitial extends CouponsStates {}

class EditingCoupons extends CouponsStates {}

class EditedCoupons extends CouponsStates {
  final String message;

  EditedCoupons({required this.message});
}

class ErrorEditingCoupons extends CouponsStates {
  final String message;

  ErrorEditingCoupons({required this.message});
}

class DeletingCoupons extends CouponsStates {}

class DeletedCoupons extends CouponsStates {
  final String message;

  DeletedCoupons({required this.message});
}

class ErrorDeletingCoupons extends CouponsStates {
  final String message;

  ErrorDeletingCoupons({required this.message});
}

class FetchingCoupons extends CouponsStates {}

class FetchedCoupons extends CouponsStates {
  // final List<BranchesData> branchList;

  // FetchedCoupons({required this.branchList});
}

class ErrorFetchingCoupons extends CouponsStates {
  final String message;

  ErrorFetchingCoupons({required this.message});
}

class SavingCoupons extends CouponsStates {}

class SavedCoupons extends CouponsStates {
  final String message;

  // final ProductData data;

  SavedCoupons({required this.message});
}

class ErrorSavingCoupons extends CouponsStates {
  final String message;

  ErrorSavingCoupons({required this.message});
}
