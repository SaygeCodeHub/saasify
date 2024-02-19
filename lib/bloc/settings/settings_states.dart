import '../../data/models/settings/settings_model.dart';
import '../../data/models/settings/update_settings_model.dart';

abstract class SettingsState {}

class InitialisingSettings extends SettingsState {}

class FetchingSettings extends SettingsState {}

class SettingsFetched extends SettingsState {
  final SettingsModel settingsModel;

  SettingsFetched({required this.settingsModel});
}

class FetchingSettingsFailed extends SettingsState {
  final String error;

  FetchingSettingsFailed({required this.error});
}

class UpdatingSettings extends SettingsState {}

class SettingsUpdated extends SettingsState {
  final UpdateSettingsModel updateSettingsModel;

  SettingsUpdated({required this.updateSettingsModel});
}

class UpdateSettingsFailed extends SettingsState {
  final String error;

  UpdateSettingsFailed({required this.error});
}
