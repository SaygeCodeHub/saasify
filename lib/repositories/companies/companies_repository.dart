import 'package:saasify/data/models/companies/add_company_model.dart';

abstract class CompaniesRepository {
  Future<AddCompanyModel> addCompany(Map companyDetails);
}
