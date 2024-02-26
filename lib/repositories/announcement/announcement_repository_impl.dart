import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/announcement/announcement_model.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/announcement/announcement_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class AnnouncementRepositoryImpl implements AnnouncementRepository {
  Cache cache = getIt<Cache>();

  @override
  Future<AnnouncementModel> addAnnouncement(
      Map<String, dynamic> announcementDetails) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();

      var response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.addAnnouncements}",
          announcementDetails);
      return AnnouncementModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<AnnouncementModel> deleteAnnouncement(int id) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();

      var response = await ClientServices().delete(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.deleteAnnouncements}/$id",
          {});
      return AnnouncementModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<GetAllAnnouncementsModel> getAllAnnouncements() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();

      var response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.getAnnouncements}");
      return GetAllAnnouncementsModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<AnnouncementModel> updateAnnouncement(
      Map<String, dynamic> announcementDetails) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();

      var response = await ClientServices().put(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.updateAnnouncements}",
          announcementDetails);
      return AnnouncementModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
