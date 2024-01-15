import '../../data/models/profile/fetch_profile_details_model.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class FetchingProfileDetails extends ProfileStates {}

class FetchedProfileDetails extends ProfileStates {
  final ProfileData profileData;

  FetchedProfileDetails({required this.profileData});
}

class ErrorFetchingProfileDetails extends ProfileStates {
  final String message;

  ErrorFetchingProfileDetails({required this.message});
}
