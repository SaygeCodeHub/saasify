import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/leaves/leaves_repository.dart';

import '../../caches/cache.dart';
import 'load_apply_leave_event.dart';
import 'load_apply_leave_state.dart';

class LoadApplyLeaveBloc extends Bloc<LoadApplyLeaveEvent, LoadApplyLeaveState> {
  final LeavesRepository _leavesRepository = getIt<LeavesRepository>();
  final Cache cache = getIt<Cache>();

  LoadApplyLeaveState get initialState => LoadApplyLeaveInitial();

  LoadApplyLeaveBloc() : super(LoadApplyLeaveInitial()) {
    on<LoadApplyLeave>(_loadApplyLeave);
  }

  FutureOr<void> _loadApplyLeave(
      LoadApplyLeave event, Emitter<LoadApplyLeaveState> emit) async {
    emit(LoadingApplyLeave());
    try {
      LoadApplyLeaveModel loadApplyLeaveModel =
      await _leavesRepository.loadApplyLeave();
      if (loadApplyLeaveModel.status == 200) {
        emit(LoadedApplyLeave(loadApplyLeaveModel: loadApplyLeaveModel));
      } else {
        emit(ErrorLoadingApplyLeave(message: loadApplyLeaveModel.message));
      }
    } catch (e) {
      emit(ErrorLoadingApplyLeave());
    }
  }
}