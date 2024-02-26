import 'package:saasify/data/models/announcement/announcement_model.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';

abstract class AnnouncementRepository {
  Future<AnnouncementModel> addAnnouncement(
      Map<String, dynamic> announcementDetails);

  Future<AnnouncementModel> deleteAnnouncement(int id);

  Future<GetAllAnnouncementsModel> getAllAnnouncements();

  Future<AnnouncementModel> updateAnnouncement(
      Map<String, dynamic> announcementDetails);
}
