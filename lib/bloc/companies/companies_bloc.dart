import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/companies/companies_event.dart';
import 'package:saasify/bloc/companies/companies_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/companies/add_company_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/companies/companies_repository.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesStates> {
  final CompaniesRepository _companiesRepository = getIt<CompaniesRepository>();
  final Cache cache = getIt<Cache>();
  final Map companyDetailsMap = {
    'branch_name': 'HQ',
    'is_head_quarter': 'True'
  };

  CompaniesStates get initialState => InitialiseCompaniesStates();

  CompaniesBloc() : super(InitialiseCompaniesStates()) {
    on<AddCompany>(_addCompany);
  }

  FutureOr<void> _addCompany(
      AddCompany event, Emitter<CompaniesStates> emit) async {
    emit(AddingCompany());
    try {
      AddCompanyModel addCompanyModel =
          await _companiesRepository.addCompany(event.companyDetails);
      if (addCompanyModel.status == 200) {
        await saveUserSelections(addCompanyModel);
        emit(CompanyAdded());
      } else {
        emit(AddingCompanyFailed(errorMessage: addCompanyModel.message));
      }
    } catch (e) {
      emit(AddingCompanyFailed(errorMessage: e.toString()));
    }
  }

  saveUserSelections(AddCompanyModel addCompanyModel) async {
    getIt<Cache>().setCompanyName(addCompanyModel.data.companyName.toString());
    getIt<Cache>().setCompanyId(addCompanyModel.data.companyId);
    getIt<Cache>().setBranchId(addCompanyModel.data.branch.branchId);
    getIt<Cache>().setBranchName(addCompanyModel.data.branch.branchName);
  }
}
