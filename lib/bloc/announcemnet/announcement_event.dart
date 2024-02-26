abstract class AnnouncementEvents {}

class AddAnnouncement extends AnnouncementEvents {
  final bool isEdit;

  AddAnnouncement({this.isEdit = false});
}

class DeleteAnnouncement extends AnnouncementEvents {
  final int id;
  DeleteAnnouncement({required this.id});
}

class GetAllAnnouncements extends AnnouncementEvents {}
