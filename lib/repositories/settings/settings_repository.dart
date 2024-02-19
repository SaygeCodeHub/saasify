import 'package:saasify/data/models/settings/settings_model.dart';

import '../../data/models/settings/update_settings_model.dart';

abstract class SettingsRepository {
  Future<SettingsModel> getSettings();

  Future<UpdateSettingsModel> updateSettings(Map updateSettingsMap);
}
