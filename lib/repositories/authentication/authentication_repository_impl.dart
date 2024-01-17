import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<AuthenticateUserModel> authenticateUser(Map userDetailsMap) async {
    try {
      print('${ApiConstants.baseUrl}${ApiConstants.authenticateUser}');
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}${ApiConstants.authenticateUser}",
          userDetailsMap);
      print('response $response');
      return AuthenticateUserModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
