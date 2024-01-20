import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<AuthenticateUserModel> authenticateUser(Map userDetailsMap) async {
    try {
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}${ApiConstants.authenticateUser}",
          userDetailsMap);
      return AuthenticateUserModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
