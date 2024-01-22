import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/attendance/check_in_model.dart';
import 'package:saasify/data/models/attendance/check_out_model.dart';
import 'package:saasify/data/models/attendance/location_permission_status.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/attendance/attendance_repository.dart';

import 'attendance_event.dart';
import 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvents, AttendanceStates> {
  final AttendanceRepository _attendanceRepository =
      getIt<AttendanceRepository>();
  final Cache cache = getIt<Cache>();

  late double officeLatitude;
  late double officeLongitude;
  late double currentLatitude;
  late double currentLongitude;

  AttendanceBloc() : super(AttendanceInitial()) {
    on<CheckIn>(_onCheckIn);
    on<CheckOut>(_onCheckOut);
  }

  void _onCheckIn(CheckIn event, Emitter<AttendanceStates> emit) async {
    emit(CheckingIn());

    try {

      List<double?> officePosition = await _getOfficeLocation();
      if (officePosition.first == null) {
        emit(ErrorCheckingIn(message: 'Error getting office location'));
        return;
      }
      officeLatitude = officePosition.first ?? 0;
      officeLongitude = officePosition.last ?? 0;

      LocationPermissionStatus locationPermissionStatus =
          await _checkLocationPermission();

      if (!locationPermissionStatus.hasPermission) {
        emit(ErrorCheckingIn(message: locationPermissionStatus.message));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      currentLatitude = position.latitude;
      currentLongitude = position.longitude;

      double distance = Geolocator.distanceBetween(
          officeLatitude, officeLongitude, currentLatitude, currentLongitude);

      if (distance < 20) {
        CheckInModel checkInModel = await _attendanceRepository.checkIn(
            1, 1, DateTime.now().toString());
        if (checkInModel.status == 200) {
          emit(CheckedIn());
        } else {
          emit(ErrorCheckingIn(message: checkInModel.message));
          return;
        }
      } else {
        emit(ErrorCheckingIn(message: 'You are not in office premises'));
        return;
      }
    } catch (e) {
      emit(ErrorCheckingIn(message: e.toString()));
    }
  }

  void _onCheckOut(CheckOut event, Emitter<AttendanceStates> emit) async {
    emit(CheckingOut());

    try {
      CheckOutModel checkOutModel =
          await _attendanceRepository.checkOut(1, 1, DateTime.now().toString());

      if (checkOutModel.status == 200) {
        emit(CheckedOut());
      } else {
        emit(ErrorCheckingOut(
            message: checkOutModel.message
        ));
        return;
      }
    }  catch (e) {
      emit(ErrorCheckingOut(message: e.toString()));
    }
  }

  Future<LocationPermissionStatus> _checkLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return LocationPermissionStatus(
            hasPermission: false,
            message: 'Location permissions are denied. Please grant access.',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return LocationPermissionStatus(
          hasPermission: false,
          message: 'Location permissions are permanently denied.',
        );
      }

      return LocationPermissionStatus(
        hasPermission: true,
        message: 'Location permissions granted.',
      );
    } catch (e) {
      return LocationPermissionStatus(
        hasPermission: false,
        message: 'Error checking location permissions: $e',
      );
    }
  }

  Future<List<double?>> _getOfficeLocation() async {
    try {
      List<double?> officePosition = await cache.getLatLong();
      if (officePosition.first == null) {
        officePosition = await _attendanceRepository.getLatLong();
      }
      return officePosition;
    } catch (e) {
      rethrow;
    }
  }
}
