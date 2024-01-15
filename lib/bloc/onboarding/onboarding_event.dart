abstract class OnboardingEvent {}

class SelectCompany extends OnboardingEvent {
  final int companyIndex;

  SelectCompany({required this.companyIndex});
}

class SelectBranch extends OnboardingEvent {
  final int branchIndex;

  SelectBranch({required this.branchIndex});
}

class SetCompanyAndBranchIds extends OnboardingEvent {
  final String companyId;
  final int branchId;

  SetCompanyAndBranchIds({required this.companyId, required this.branchId});
}
