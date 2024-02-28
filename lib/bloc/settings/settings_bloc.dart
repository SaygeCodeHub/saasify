import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saasify/bloc/settings/settings_events.dart';
import 'package:saasify/bloc/settings/settings_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/settings/settings_repository.dart';

import '../../data/models/attendance/location_permission_status.dart';
import '../../data/models/settings/update_settings_model.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final Cache cache = getIt<Cache>();
  Map updateSettingsMap = {};

  SettingsState get initialState => InitialisingSettings();

  SettingsBloc() : super(InitialisingSettings()) {
    on<GetAllSettings>(_getAllSettings);
    on<UpdateSettings>(_updateBranchSettings);
    on<FetchGeoLocation>(_fetchGeoLocation);
  }

  FutureOr<void> _getAllSettings(
      GetAllSettings event, Emitter<SettingsState> emit) async {
    emit(FetchingSettings());
    updateSettingsMap = {};
    try {
      SettingsModel settingsModel = await _settingsRepository.getSettings();
      if (settingsModel.status == 200) {
        updateSettingsMap.addAll(settingsModel.data.toJson());
        updateSettingsMap["default_approver"] =
            settingsModel.data.defaultApprover.id;
        emit(SettingsFetched(settingsModel: settingsModel));
      } else {
        emit(FetchingSettingsFailed(error: settingsModel.message));
      }
    } catch (e) {
      emit(FetchingSettingsFailed(error: e.toString()));
    }
  }

  FutureOr<void> _updateBranchSettings(
      UpdateSettings event, Emitter<SettingsState> emit) async {
    emit(UpdatingSettings());
    try {
      UpdateSettingsModel updateSettingsModel =
          await _settingsRepository.updateSettings(updateSettingsMap);
      if (updateSettingsModel.status == 200) {
        emit(SettingsUpdated(updateSettingsModel: updateSettingsModel));
      } else {
        emit(UpdateSettingsFailed(error: updateSettingsModel.message));
      }
    } catch (e) {
      emit(UpdateSettingsFailed(error: e.toString()));
    }
  }

  FutureOr<void> _fetchGeoLocation(
      FetchGeoLocation event, Emitter<SettingsState> emit) async {
    emit(FetchingGeoLocation());
    try {
      LocationPermissionStatus locationPermissionStatus =
          await _checkLocationPermission();

      if (!locationPermissionStatus.hasPermission) {
        emit(
            FetchingGeoLocationFailed(error: locationPermissionStatus.message));
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      emit(GeoLocationFetched(position: position));
    } catch (e) {
      emit(FetchingGeoLocationFailed(error: e.toString()));
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
}
