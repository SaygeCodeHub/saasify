import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_event.dart';
import 'package:saasify/bloc/announcemnet/announcement_state.dart';
import 'package:saasify/data/models/announcement/announcement_model.dart';
import 'package:saasify/data/models/announcement/get_all_announcements_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/announcement/announcement_repository.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvents, AnnouncementStates> {
  final AnnouncementRepository announcementRepository =
      getIt<AnnouncementRepository>();

  Map<String, dynamic> announcementDetails = {};

  AnnouncementBloc() : super(AnnouncementInitial()) {
    on<AddAnnouncement>(_addAnnouncement);
    on<DeleteAnnouncement>(_deleteAnnouncement);
    on<GetAllAnnouncements>(_getAllAnnouncements);
  }

  void _addAnnouncement(
      AddAnnouncement event, Emitter<AnnouncementStates> emit) async {
    emit(AddingAnnouncement());
    try {
      AnnouncementModel addAnnouncementModel = event.isEdit
          ? await announcementRepository.updateAnnouncement(announcementDetails)
          : await announcementRepository.addAnnouncement(announcementDetails);
      if (addAnnouncementModel.status == 200) {
        emit(AnnouncementAdded());
      } else {
        emit(ErrorAddingAnnouncement(addAnnouncementModel.message));
      }
    } catch (e) {
      emit(ErrorAddingAnnouncement(e.toString()));
    }
  }

  void _deleteAnnouncement(
      DeleteAnnouncement event, Emitter<AnnouncementStates> emit) async {
    emit(DeletingAnnouncement());
    try {
      AnnouncementModel deleteAnnouncementModel =
          await announcementRepository.deleteAnnouncement(event.id);
      if (deleteAnnouncementModel.status == 200) {
        emit(AnnouncementDeleted());
      } else {
        emit(ErrorDeletingAnnouncement(deleteAnnouncementModel.message));
      }
    } catch (e) {
      emit(ErrorDeletingAnnouncement(e.toString()));
    }
  }

  void _getAllAnnouncements(
      GetAllAnnouncements event, Emitter<AnnouncementStates> emit) async {
    emit(GettingAllAnnouncements());
    try {
      GetAllAnnouncementsModel getAllAnnouncementsModel =
          await announcementRepository.getAllAnnouncements();
      if (getAllAnnouncementsModel.status == 200) {
        emit(AllAnnouncementsFetched(getAllAnnouncementsModel.data));
      } else {
        emit(ErrorGettingAllAnnouncements(getAllAnnouncementsModel.message));
      }
    } catch (e) {
      emit(ErrorGettingAllAnnouncements(e.toString()));
    }
  }

  void setAnnouncementDetails(Announcement details) {
    announcementDetails = details.toJson();
  }
}
