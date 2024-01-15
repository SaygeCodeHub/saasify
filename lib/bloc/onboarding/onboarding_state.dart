abstract class OnboardingStates {}

class OnboardingInitial extends OnboardingStates {}

class CompaniesLoaded extends OnboardingStates {
  final int selectedCompanyIndex;

  CompaniesLoaded({required this.selectedCompanyIndex});
}

class BranchesLoaded extends OnboardingStates {
  final int selectedBranchIndex;

  BranchesLoaded({required this.selectedBranchIndex});
}
