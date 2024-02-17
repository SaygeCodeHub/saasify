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
      return SettingsModel.fromJson(response);
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
