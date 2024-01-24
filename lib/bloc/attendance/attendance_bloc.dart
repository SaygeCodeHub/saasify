import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/attendance/attendance_model.dart';
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
  double currentLatitude = 0;
  double currentLongitude = 0;

  bool isCheckedIn = true;

  AttendanceBloc() : super(AttendanceInitial()) {
    on<MarkAttendance>(_onMarkAttendance);
    on<CheckAttendance>(_onCheckAttendance);
  }

  void _onCheckAttendance(
      CheckAttendance event, Emitter<AttendanceStates> emit) async {
    if (event.checkInTime != null && event.checkOutTime == null) {
      isCheckedIn = true;
    } else {
      isCheckedIn = false;
    }
  }

  void _onMarkAttendance(
      MarkAttendance event, Emitter<AttendanceStates> emit) async {
    emit(MarkingAttendance());

    try {
      List<double?> officePosition = await _getOfficeLocation();
      if (officePosition.first == null) {
        emit(ErrorMarkingAttendance(message: 'Error getting office location'));
        return;
      }
      officeLatitude = officePosition.first ?? 0;
      officeLongitude = officePosition.last ?? 0;

      LocationPermissionStatus locationPermissionStatus =
          await _checkLocationPermission();

      if (!locationPermissionStatus.hasPermission) {
        emit(ErrorMarkingAttendance(message: locationPermissionStatus.message));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

      currentLatitude = position.latitude;
      currentLongitude = position.longitude;

      double distance = Geolocator.distanceBetween(
          officeLatitude, officeLongitude, currentLatitude, currentLongitude);

      log(officeLatitude.toString());
      log(officeLongitude.toString());
      log(currentLatitude.toString());
      log(currentLongitude.toString());
      log(distance.toString());

      if (distance < 20) {
        AttendanceModel checkInModel = await _attendanceRepository
            .markAttendance(1, 1, DateTime.now().toString());
        if (checkInModel.status == 200) {
          isCheckedIn = !isCheckedIn;
          emit(MarkedAttendance());
        } else {
          emit(ErrorMarkingAttendance(message: checkInModel.message));
          return;
        }
      } else {
        emit(ErrorMarkingAttendance(message: 'You are not in office premises'));
        return;
      }
    } catch (e) {
      emit(ErrorMarkingAttendance(message: e.toString()));
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
