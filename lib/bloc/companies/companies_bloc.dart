import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/companies/companies_event.dart';
import 'package:saasify/bloc/companies/companies_states.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesStates> {
  CompaniesBloc(super.initialState);
}
