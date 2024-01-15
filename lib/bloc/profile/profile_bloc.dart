import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/profile/profile_event.dart';
import 'package:saasify/bloc/profile/profile_states.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../data/models/profile/fetch_profile_details_model.dart';
import '../../di/app_module.dart';
import '../../repositories/profile/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final ProfileRepository _profileRepository = getIt<ProfileRepository>();

  ProfileStates get initialState => ProfileInitial();

  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfileDetails>(_fetchProfileDetails);
  }

  FutureOr<void> _fetchProfileDetails(
      FetchProfileDetails event, Emitter<ProfileStates> emit) async {
    emit(FetchingProfileDetails());
    // try {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    FetchProfileDetailsModel fetchProfileDetailsModel = await _profileRepository
        .fetchProfileDetails(userId, companyId, branchId);
    if (fetchProfileDetailsModel.status == 200) {
      emit(FetchedProfileDetails(profileData: fetchProfileDetailsModel.data));
    } else {
      emit(ErrorFetchingProfileDetails(
          message: fetchProfileDetailsModel.message));
    }
    // } catch (e) {
    //   emit(ErrorFetchingProfileDetails(message: e.toString()));
    // }
  }
}
