import 'package:saasify/data/models/settings/settings_model.dart';

abstract class SettingsRepository {
  Future<SettingsModel> getSettings();
}
