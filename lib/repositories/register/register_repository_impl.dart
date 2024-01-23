import 'package:saasify/data/models/register/register_user_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<RegisterUserModel> registerUser(Map userDetailsMap) async {
    try {
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}${ApiConstants.registerUser}",
          userDetailsMap);
      return RegisterUserModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
