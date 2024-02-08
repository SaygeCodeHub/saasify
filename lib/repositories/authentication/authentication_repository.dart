import 'package:saasify/data/models/authentication/authenticate_user_model.dart';
import 'package:saasify/data/models/authentication/forgot_password_model.dart';
import 'package:saasify/data/models/authentication/update_password_model.dart';

abstract class AuthenticationRepository {
  Future<AuthenticateUserModel> authenticateUser(Map userDetailsMap);
  Future<ForgotPasswordModel> forgotUserPassword(Map userForgotPasswordMap);
  Future<UpdatePasswordModel> updateUserPassword(Map userUpdatePasswordMap);
}
