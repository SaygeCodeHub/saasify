abstract class AnnouncementEvents {}

class AddAnnouncement extends AnnouncementEvents {}

class DeleteAnnouncement extends AnnouncementEvents {
  final int id;
  DeleteAnnouncement({required this.id});
}

class GetAllAnnouncements extends AnnouncementEvents {}
