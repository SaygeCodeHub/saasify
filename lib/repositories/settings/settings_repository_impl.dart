import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/settings/settings_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final Cache cache = getIt<Cache>();

  @override
  Future<SettingsModel> getSettings() async {
    var companyId = await cache.getCompanyId();
    var branchId = await cache.getBranchId();
    var userId = await cache.getUserId();
    try {
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.getBranchSettings}");
      return SettingsModel.fromJson({
        "status": 200,
        "message": "Settings fetched!",
        "data": {
          "time_in": "2024-02-17T09:30:00+05:30",
          "time_out": "2024-02-17T18:30:00+05:30",
          "timezone": null,
          "currency": "INR",
          "default_approver": {"id": 1, "approver_name": "Aditi Diwan"},
          "working_days": 30,
          "total_medical_leaves": 12,
          "total_casual_leaves": 3,
          "overtime_rate": 20.0,
          "overtime_rate_per": "HOUR",
          "branch_address": "",
          "pincode": null,
          "longitude": null,
          "latitude": null
        }
      });
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SettingsModel> updateSettings(Map updateSettingsMap) async {
    var companyId = await cache.getCompanyId();
    var branchId = await cache.getBranchId();
    var userId = await cache.getUserId();
    try {
      final response = await ClientServices().put(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.updateBranchSettings}",
          updateSettingsMap);
      return SettingsModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
