import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/announcement/add_announcement_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/announcement/announcement_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class AnnouncementRepositoryImpl implements AnnouncementRepository {
  Cache cache = getIt<Cache>();

  @override
  Future<AddAnnouncementModel> addAnnouncement(
      Map<String, dynamic> announcementDetails) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();

      var response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.addAnnouncements}",
          announcementDetails);
      return AddAnnouncementModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
