abstract class AnnouncementStates {}

class AnnouncementInitial extends AnnouncementStates {}

class AddingAnnouncement extends AnnouncementStates {}

class AnnouncementAdded extends AnnouncementStates {}

class ErrorAddingAnnouncement extends AnnouncementStates {
  final String errorMessage;

  ErrorAddingAnnouncement(this.errorMessage);
}
