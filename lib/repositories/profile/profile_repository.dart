import '../../data/models/profile/fetch_profile_details_model.dart';

abstract class ProfileRepository {
  Future<FetchProfileDetailsModel> fetchProfileDetails(
      String userId, String companyId, int branchId);
}
