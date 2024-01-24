abstract class CompaniesStates {}

class InitialiseCompaniesStates extends CompaniesStates {}

class AddingCompany extends CompaniesStates {}

class CompanyAdded extends CompaniesStates {}

class AddingCompanyFailed extends CompaniesStates {
  final String errorMessage;

  AddingCompanyFailed({required this.errorMessage});
}
