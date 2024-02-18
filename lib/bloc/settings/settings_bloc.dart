import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_events.dart';
import 'package:saasify/bloc/settings/settings_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/settings/settings_repository.dart';

import '../../data/models/settings/update_settings_model.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final Cache cache = getIt<Cache>();
  Map updateSettingsMap = {};
  ValueNotifier<bool> isEdit = ValueNotifier<bool>(true);

  SettingsState get initialState => InitialisingSettings();

  SettingsBloc() : super(InitialisingSettings()) {
    on<GetAllSettings>(_getAllSettings);
    on<UpdateSettings>(_updateBranchSettings);
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
}
