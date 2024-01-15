import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/customer_cache/customer_cache.dart';
import '../../di/app_module.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();

  OnboardingBloc() : super(OnboardingInitial()) {
    on<SelectBranch>(_selectBranch);
    on<SelectCompany>(_selectCompany);
    on<SetCompanyAndBranchIds>(_setCompanyAndBranchIds);
  }

  FutureOr<void> _selectCompany(
      SelectCompany event, Emitter<OnboardingStates> emit) {
    emit(CompaniesLoaded(selectedCompanyIndex: event.companyIndex));
  }

  FutureOr<void> _selectBranch(
      SelectBranch event, Emitter<OnboardingStates> emit) {
    emit(BranchesLoaded(selectedBranchIndex: event.branchIndex));
  }

  FutureOr<void> _setCompanyAndBranchIds(
      SetCompanyAndBranchIds event, Emitter<OnboardingStates> emit) {
    _customerCache.setCompanyId(event.companyId);
    _customerCache.setBranchId(event.branchId);
  }
}
