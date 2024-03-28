abstract class CompaniesState {}

final class CompaniesInitial extends CompaniesState {}

final class AddingCompany extends CompaniesState {}

final class CompanyAdded extends CompaniesState {}

final class CompanyNotAdded extends CompaniesState {
  final String errorMessage;

  CompanyNotAdded({required this.errorMessage});
}
