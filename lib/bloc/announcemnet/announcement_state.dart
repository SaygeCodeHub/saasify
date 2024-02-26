import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';

abstract class AnnouncementStates {}

class AnnouncementInitial extends AnnouncementStates {}

class AddingAnnouncement extends AnnouncementStates {}

class AnnouncementAdded extends AnnouncementStates {}

class ErrorAddingAnnouncement extends AnnouncementStates {
  final String errorMessage;

  ErrorAddingAnnouncement(this.errorMessage);
}

class DeletingAnnouncement extends AnnouncementStates {}

class AnnouncementDeleted extends AnnouncementStates {}

class ErrorDeletingAnnouncement extends AnnouncementStates {
  final String errorMessage;

  ErrorDeletingAnnouncement(this.errorMessage);
}

class GettingAllAnnouncements extends AnnouncementStates {}

class AllAnnouncementsFetched extends AnnouncementStates {
  final List<Announcement> announcements;

  AllAnnouncementsFetched(this.announcements);
}

class ErrorGettingAllAnnouncements extends AnnouncementStates {
  final String errorMessage;

  ErrorGettingAllAnnouncements(this.errorMessage);
}
