import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
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
  final Cache _cache = getIt<Cache>();

  late double officeLatitude;
  late double officeLongitude;
  double currentLatitude = 0;
  double currentLongitude = 0;

  ValueNotifier<String?> checkInTime = ValueNotifier<String?>(null);
  ValueNotifier<String?> checkOutTime = ValueNotifier<String?>(null);

  AttendanceBloc() : super(AttendanceInitial()) {
    on<MarkAttendance>(_onMarkAttendance);
    on<FetchAttendance>(_onFetchAttendance);
  }

  void _onFetchAttendance(
      FetchAttendance event, Emitter<AttendanceStates> emit) async {
    try {

      AttendanceModel attendanceModel = await _attendanceRepository
          .getAttendance();

      if (attendanceModel.status == 200) {
        checkInTime.value = formatDate(attendanceModel.data.checkIn);
        checkOutTime.value = formatDate(attendanceModel.data.checkOut);
      }
    } catch (e) {
      emit(ErrorFetchingAttendance(message: e.toString()));
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

      if (distance < 100) {
        AttendanceModel attendanceModel = await _attendanceRepository
            .markAttendance();
        if (attendanceModel.status == 200) {
          checkInTime.value = formatDate(attendanceModel.data.checkIn);
          checkOutTime.value = formatDate(attendanceModel.data.checkOut);
          emit(MarkedAttendance());
        } else {
          emit(ErrorMarkingAttendance(message: attendanceModel.message));
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
      List<double?> officePosition = await _cache.getLatLong();
      if (officePosition.first == null) {
        officePosition = await _attendanceRepository.getLatLong();
      }
      return officePosition;
    } catch (e) {
      rethrow;
    }
  }

  String? formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat("HH:mm").format(date);
    }
    return null;
  }
}
