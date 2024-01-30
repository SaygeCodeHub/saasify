import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/leaves/apply_leave_model.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/leaves/leaves_repository.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final LeavesRepository _leavesRepository = getIt<LeavesRepository>();
  final Cache cache = getIt<Cache>();

  LeaveState get initialState => LoadApplyLeaveInitial();

  LeaveBloc() : super(LoadApplyLeaveInitial()) {
    on<LoadApplyLeaveScreen>(_loadApplyLeaveScreen);
    on<ApplyLeave>(_applyLeave);
  }

  FutureOr<void> _loadApplyLeaveScreen(
      LoadApplyLeaveScreen event, Emitter<LeaveState> emit) async {
    emit(LoadingApplyLeaveScreen());
    try {
      LoadApplyLeaveScreenModel loadApplyLeaveScreenModel =
          await _leavesRepository.loadApplyLeaveScreen();
      if (loadApplyLeaveScreenModel.status == 200) {
        emit(LoadedApplyLeaveScreen(
            loadApplyLeaveScreenModel: loadApplyLeaveScreenModel));
      } else {
        emit(ErrorLoadingApplyLeaveScreen(
            message: loadApplyLeaveScreenModel.message));
      }
    } catch (e) {
      emit(ErrorLoadingApplyLeaveScreen());
    }
  }

  FutureOr<void> _applyLeave(ApplyLeave event, Emitter<LeaveState> emit) async {
    emit(ApplyingLeave());
    try {
      Map applyLeaveDetailsMap = {
        "leave_type": event.leaveDetailsMap["leave_type"],
        "start_date": event.leaveDetailsMap["start_date"],
        "end_date": event.leaveDetailsMap["end_date"],
        "approvers":event.leaveDetailsMap["approvers"].id,
        "leave_reason":event.leaveDetailsMap["leave_reason"]
      };
      ApplyLeaveModel applyLeaveModel =
          await _leavesRepository.applyLeave(applyLeaveDetailsMap);
      if (applyLeaveModel.status == 200) {
        emit(LeaveApplied(applyLeaveModel: applyLeaveModel));
      } else {
        emit(ApplyLeaveFailed(errorMessage: applyLeaveModel.message));
      }
    } catch (e) {
      emit(ApplyLeaveFailed(errorMessage: e.toString()));
    }
  }
}
