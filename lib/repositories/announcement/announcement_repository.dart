import 'package:saasify/data/models/announcement/add_announcement_model.dart';

abstract class AnnouncementRepository {
  Future<AddAnnouncementModel> addAnnouncement(
      Map<String, dynamic> announcementDetails);
}
