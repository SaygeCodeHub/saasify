import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_event.dart';
import 'package:saasify/bloc/announcemnet/announcement_state.dart';
import 'package:saasify/data/models/announcement/add_announcement_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/announcement/announcement_repository.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvents, AnnouncementStates> {
  final AnnouncementRepository announcementRepository =
      getIt<AnnouncementRepository>();

  Map<String, dynamic> announcementDetails = {};

  AnnouncementBloc() : super(AnnouncementInitial()) {
    on<AddAnnouncement>(_addAnnouncement);
  }

  void _addAnnouncement(
      AddAnnouncement event, Emitter<AnnouncementStates> emit) async {
    emit(AddingAnnouncement());
    try {
      AddAnnouncementModel addAnnouncementModel =
          await announcementRepository.addAnnouncement(announcementDetails);
      if (addAnnouncementModel.status == 200) {
        emit(AnnouncementAdded());
      } else {
        emit(ErrorAddingAnnouncement(addAnnouncementModel.message));
      }
    } catch (e) {
      emit(ErrorAddingAnnouncement(e.toString()));
    }
  }
}
