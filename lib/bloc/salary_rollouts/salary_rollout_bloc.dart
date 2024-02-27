import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/salary_rollouts/salary_rollout_event.dart';
import 'package:saasify/bloc/salary_rollouts/salary_rollout_state.dart';
import 'package:saasify/data/models/salary_rollouts/fetch_salary_rollout_model.dart';
import 'package:saasify/repositories/salary_rollouts/salary_rollout_repository.dart';

import '../../caches/cache.dart';
import '../../data/models/salary_rollouts/calculate_deduction_model.dart';
import '../../di/app_module.dart';

class SalaryRolloutBloc extends Bloc<SalaryRolloutEvents, SalaryRolloutStates> {
  final SalaryRolloutRepository _salaryRolloutRepository =
      getIt<SalaryRolloutRepository>();
  final Cache cache = getIt<Cache>();
  bool payAll = true;

  SalaryRolloutBloc() : super(SalaryRolloutInitial()) {
    on<FetchSalaryRollout>(_getSalaryRollout);
    on<FetchRolloutCalculation>(_fetchingSalaryCalculation);
  }

  _getSalaryRollout(
      FetchSalaryRollout event, Emitter<SalaryRolloutStates> emit) async {
    emit(FetchingSalaryRollouts());
    try {
      FetchSalaryRolloutModel fetchSalaryRolloutModel =
          await _salaryRolloutRepository.fetchSalaryRollout();
      if (fetchSalaryRolloutModel.status == 200) {
        payAll =
            fetchSalaryRolloutModel.data.allRolledOut == true ? false : true;
        emit(SalaryRolloutsFetched(
            fetchSalaryRolloutModel: fetchSalaryRolloutModel));
      } else {
        emit(ErrorFetchingSalaryRollouts(
            errorMessage: fetchSalaryRolloutModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingSalaryRollouts(errorMessage: e.toString()));
    }
  }

  _fetchingSalaryCalculation(
      FetchRolloutCalculation event, Emitter<SalaryRolloutStates> emit) async {
    emit(FetchingSalaryCalculation());
    try {
      CalculateDeductionModel calculateDeductionModel =
          await _salaryRolloutRepository.calculateDeduction(event.employeeId);
      if (calculateDeductionModel.status == 200) {
        emit(SalaryCalculationFetched(
            calculateDeductionModel: calculateDeductionModel));
      } else {
        emit(ErrorFetchingSalaryCalculation(
            errorMessage: calculateDeductionModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingSalaryCalculation(errorMessage: e.toString()));
    }
  }
}
