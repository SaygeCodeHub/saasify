abstract class CompaniesEvent {}

class AddCompany extends CompaniesEvent {
  final Map companyDetailsMap;

  AddCompany({required this.companyDetailsMap});
}
