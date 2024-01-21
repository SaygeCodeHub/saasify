import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saasify/data/models/attendance/check_in_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/attendance/attendance_repository.dart';

import 'attendance_event.dart';
import 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvents, AttendanceStates> {
  AttendanceRepository _attendanceRepository = getIt<AttendanceRepository>();

  AttendanceBloc() : super(AttendanceInitial()) {
    on<CheckIn>(_onCheckIn);
    on<CheckOut>(_onCheckOut);
  }

  void _onCheckIn(CheckIn event, Emitter<AttendanceStates> emit) async{
    emit(CheckingIn());

    try {
      
      // Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude)

      CheckInModel checkInModel = await _attendanceRepository.checkIn(1, 1);

      if (checkInModel.status == 200) {
        emit(CheckedIn());
      } else {
        emit(ErrorCheckingIn());
      }
    } catch (e) {
      emit(ErrorCheckingIn());
    }

    emit(CheckedIn());
  }

  void _onCheckOut(CheckOut event, Emitter<AttendanceStates> emit) {
    emit(CheckedOut());
  }
}
