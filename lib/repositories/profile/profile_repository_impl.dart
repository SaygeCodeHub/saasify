import 'package:saasify/data/models/profile/fetch_profile_details_model.dart';
import 'package:saasify/repositories/profile/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<FetchProfileDetailsModel> fetchProfileDetails(
      String userId, String companyId, int branchId) async {
    final response = {
      "status": 200,
      "message": "Success",
      "data": {
        "store_logo": "",
        "store_name": "Saasify Local",
        "owner_name": "Adityaaaaaa",
        "owner_contact": 918888881800,
        "email": "",
        "address": "Saasify Nagpur"
      }
    };
    // final response = await ClientServices().get(
    //     '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllCategories');
    return FetchProfileDetailsModel.fromJson(response);
  }
}
