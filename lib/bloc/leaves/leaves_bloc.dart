import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/leaves/leaves_repository.dart';

class LeavesBloc extends Bloc<LeaveEvents, LeaveStates> {
  final LeavesRepository _leavesRepository = getIt<LeavesRepository>();
  final Cache cache = getIt<Cache>();
  List<String> typeOfLeaves = ['Medical Leave', 'Casual Leave'];

  LeaveStates get initialState => LoadLeaveInitialise();

  LeavesBloc() : super(LoadLeaveInitialise()) {
    on<LoadApplyLeaveScreen>(_loadApplyLeaveScreen);
  }

  FutureOr<void> _loadApplyLeaveScreen(
      LoadApplyLeaveScreen event, Emitter<LeaveStates> emit) async {
    emit(LoadingApplyLeaveScreen());
    try {
      LoadApplyLeaveScreenModel loadApplyLeaveScreenModel =
          await _leavesRepository.loadApplyLeaveScreen();
      if (loadApplyLeaveScreenModel.status == 200) {
        emit(ApplyLeaveScreenLoaded(
            loadApplyLeaveScreenModel: loadApplyLeaveScreenModel));
      } else {
        emit(ErrorLoadingApplyLeaveScreen(
            message: loadApplyLeaveScreenModel.message));
      }
    } catch (e) {
      emit(ErrorLoadingApplyLeaveScreen());
    }
  }
}
