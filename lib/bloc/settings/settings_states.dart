abstract class SettingsState {}

class InitialisingSettings extends SettingsState {}

class FetchingSettings extends SettingsState {}

class SettingsFetched extends SettingsState {}

class FetchingSettingsFailed extends SettingsState {
  final String error;

  FetchingSettingsFailed({required this.error});
}
