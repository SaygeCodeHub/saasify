import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/timesheet/timesheet_events.dart';
import 'package:saasify/bloc/timesheet/timesheet_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/timesheet/timesheet_attendance_history_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/timesheet/timesheet_repository.dart';

class TimeSheetBloc extends Bloc<TimeSheetEvents, TimeSheetStates> {
  final TimeSheetRepository _timeSheetRepository = getIt<TimeSheetRepository>();
  final Cache cache = getIt<Cache>();

  TimeSheetStates get initialState => TimeSheetInitialise();

  TimeSheetBloc() : super(TimeSheetInitialise()) {
    on<GetTimesheet>(_timeSheetAttendanceHistory);
  }

  FutureOr<void> _timeSheetAttendanceHistory(
      GetTimesheet event, Emitter<TimeSheetStates> emit) async {
    emit(FetchingTimesheet());
    try {
      TimesheetModel timesheetModel =
          await _timeSheetRepository.timeSheetAttendanceHistory();
      if (timesheetModel.status == 200) {
        emit(TimesheetFetched(timesheetModel: timesheetModel));
      } else {
        emit(FetchTimesheetError(message: timesheetModel.message));
      }
    } catch (e) {
      emit(FetchTimesheetError(message: e.toString()));
    }
  }
}
