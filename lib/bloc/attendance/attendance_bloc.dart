import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/attendance/check_in_model.dart';
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
      List<double?> latlong = await cache.getLatLong();
      if (latlong.first != null) {
        officeLatitude = latlong.first ?? 0;
        officeLongitude = latlong.last ?? 0;
      } else {
        latlong = await _attendanceRepository.getLatLong();
        officeLatitude = latlong.first ?? 0;
        officeLongitude = latlong.last ?? 0;
      }

      LocationPermissionStatus locationPermissionStatus =
          await checkLocationPermission();

      if (!locationPermissionStatus.hasPermission) {
        emit(ErrorCheckingIn());
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
      double distance = Geolocator.distanceBetween(
          officeLatitude, officeLongitude, currentLatitude, currentLongitude);

      if (distance < 20) {
        CheckInModel checkInModel = await _attendanceRepository.checkIn(1, 1);
        if (checkInModel.status == 200) {
          emit(CheckedIn());
        } else {
          emit(ErrorCheckingIn());
        }
      }
    } catch (e) {
      emit(ErrorCheckingIn());
    }

    emit(CheckedIn());
  }

  void _onCheckOut(CheckOut event, Emitter<AttendanceStates> emit) {
    emit(CheckedOut());
  }

  Future<LocationPermissionStatus> checkLocationPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationPermissionStatus(
          hasPermission: false,
          message: 'Location services are disabled. Please enable them.',
        );
      }

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
}
