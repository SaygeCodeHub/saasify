import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/data/models/authentication/forgot_password_model.dart';
import 'package:saasify/data/models/authentication/update_password_model.dart';
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

  @override
  Future<ForgotPasswordModel> forgotUserPassword(
      Map userForgotPasswordMap) async {
    try {
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}${ApiConstants.forgotPassword}",
          userForgotPasswordMap);
      return ForgotPasswordModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<UpdatePasswordModel> updateUserPassword(Map updatePasswordMap) async {
    try {
      final response = await ClientServices().put(
          "${ApiConstants.baseUrl}${ApiConstants.updatePassword}",
          updatePasswordMap);
      return UpdatePasswordModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
