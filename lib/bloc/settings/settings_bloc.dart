import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_events.dart';
import 'package:saasify/bloc/settings/settings_states.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/settings/settings_repository.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final Cache cache = getIt<Cache>();
  final Map userInputAuthenticationMap = {};
  ValueNotifier<bool> isEdit = ValueNotifier<bool>(false);

  SettingsState get initialState => InitialisingSettings();

  SettingsBloc() : super(InitialisingSettings()) {
    on<GetAllSettings>(_getAllSettings);
  }

  FutureOr<void> _getAllSettings(
      GetAllSettings event, Emitter<SettingsState> emit) async {
    emit(FetchingSettings());
    try {
      SettingsModel settingsModel = await _settingsRepository.getSettings();
      if (settingsModel.status == 200) {
        emit(SettingsFetched());
      } else {
        emit(FetchingSettingsFailed(error: settingsModel.message));
      }
    } catch (e) {
      emit(FetchingSettingsFailed(error: e.toString()));
    }
  }
}
