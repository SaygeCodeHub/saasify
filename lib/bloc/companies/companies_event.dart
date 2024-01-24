abstract class CompaniesEvent {}

class AddCompany extends CompaniesEvent {
  final Map companyDetails;

  AddCompany({required this.companyDetails});
}
